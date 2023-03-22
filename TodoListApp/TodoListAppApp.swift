//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by Adi Amoyal on 21/03/2023.
//

import SwiftUI

@main
struct TodoListAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
