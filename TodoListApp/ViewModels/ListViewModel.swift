//
//  ListViewModel.swift
//  TodoListApp
//
//  Created by Adi Amoyal on 21/03/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "First", isCompleted: false),
            ItemModel(title: "second", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
        self.items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveButtonPressed(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        self.items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let safeIndex = items.firstIndex(where: { $0.id == item.id }) {
            items[safeIndex] = item.updateCompletion()
        }
    }
}
