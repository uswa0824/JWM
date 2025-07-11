//  ContentView.swift
//  JWM
//
//  Created by Jeremiah Morris on 7/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        TabView {
            Group {
                #if os(iOS)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    iPadView()
                } else {
                    iPhoneView()
                }
                #else
                iPhoneView() // Default for non-iOS targets
                #endif
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct iPadView: View {
    var body: some View {
        VStack {
            Text("Hello, iPad!")
                .font(.largeTitle)
                .padding()
            // Add more iPad specific UI here
        }
    }
}

struct iPhoneView: View {
    let itemCount = 5
    let minItemScale: CGFloat = 0.8 // adjust as needed
    let maxItemScale: CGFloat = 1.3 // adjust as needed

    func scaleFor(offset: CGFloat, total: CGFloat) -> CGFloat {
        let maxDistance = total / 2
        let normalized = min(1.0, abs(offset) / maxDistance)
        // Center item is maxItemScale, others fall to minItemScale at the edges
        return minItemScale + (maxItemScale - minItemScale) * (1 - normalized) // At center: maxItemScale, at edge: minItemScale
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                let scale: CGFloat = min(1, width / 400)

                VStack {
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(Array(0..<itemCount), id: \.self) { index in
                            if index == 0 {
                                NavigationLink(destination: HIITWorkoutView()) {
                                    Text("Item 1")
                                        .frame(width: 80, height: 80)
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                                .fill(Color(.secondarySystemBackground))
                                        )
                                }
                                .padding(.vertical, 12)
                            } else {
                                Button(action: {
                                    print("Tapped Item \(index + 1)")
                                }) {
                                    Text("Item \(index + 1)")
                                        .frame(width: 80, height: 80)
                                        .font(.headline)
                                        .foregroundColor(.accentColor)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                                                .fill(Color(.secondarySystemBackground))
                                        )
                                }
                                .padding(.vertical, 12)
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationTitle("Hello, iPhone or other device!")
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
