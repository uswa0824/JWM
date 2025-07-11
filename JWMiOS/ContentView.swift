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
    @State private var isShowingHIIT = false

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                LazyVGrid(columns: columns, spacing: 30) {
                    Button(action: {
                        isShowingHIIT = true
                    }) {
                        VStack(spacing: 12) {
                            Text("HIIT")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "figure.highintensity.intervaltraining.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.cyan)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

                    Button(action: {
                        print("Tapped AMRAP")
                    }) {
                        VStack(spacing: 12) {
                            Text("AMRAP")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "bolt.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.yellow)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

                    Button(action: {
                        print("Tapped CIRCUIT")
                    }) {
                        VStack(spacing: 12) {
                            Text("CIRCUIT")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "flame.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.red)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

                    Button(action: {
                        print("Tapped INDOOR RUN")
                    }) {
                        VStack(spacing: 12) {
                            Text("INDOOR RUN")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "figure.run")
                                .font(.system(size: 40))
                                .foregroundColor(.green)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

                    Button(action: {
                        print("Tapped STRENGTH")
                    }) {
                        VStack(spacing: 12) {
                            Text("STRENGTH")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "heart.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.pink)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)

                    Button(action: {
                        print("Tapped STRENGT")
                    }) {
                        VStack(spacing: 12) {
                            Text("STRENGT")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            Image(systemName: "star.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.orange)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(
                                LinearGradient(
                                    colors: [Color.black, Color.gray],
                                    startPoint: .bottomLeading,
                                    endPoint: .topTrailing
                                )
                            )
                    )
                    .shadow(color: Color.white.opacity(0.15), radius: 6, x: 0, y: -4)
                    .shadow(color: Color.black.opacity(0.45), radius: 12, x: 0, y: 8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
                }
                .padding(10)
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            .navigationDestination(isPresented: $isShowingHIIT) {
                HIITIos()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("Menu tapped")
                    }) {
                        Image(systemName: "line.3.horizontal")
                      
                    }
                    
                }
                ToolbarItem(placement: .principal) {
                    ZStack {
                        Text("JWM")
                            .font(.system(size: 50, weight: .semibold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                 colors: [Color.blue, Color.cyan],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .shadow(color: Color.white.opacity(0.5), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.7), radius: 5, x: 0, y: 4)
                    }
                }
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

