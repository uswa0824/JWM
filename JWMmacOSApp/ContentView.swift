//
//  ContentView.swift
//  JWMmacOSApp
//
//  Created by Jeremiah Morris on 7/5/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var selectedItemID: Item.ID? = nil

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedItemID) {
                ForEach(items) { item in
                    NavigationLink(
                        value: item.id
                    ) {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                ToolbarItem {
                    Button(action: removeSelectedItem) {
                        Label("Remove", systemImage: "trash")
                    }
                    .disabled(selectedItemID == nil)
                }
            }
        } detail: {
            Text("Select an item")
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
    
    private func removeSelectedItem() {
        guard let id = selectedItemID, let item = items.first(where: { $0.id == id }) else { return }
        withAnimation {
            modelContext.delete(item)
            selectedItemID = nil
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
