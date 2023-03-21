//
//  AddView.swift
//  TodoListApp
//
//  Created by Adi Amoyal on 21/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(.gray.opacity(0.18))
                    .cornerRadius(10)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .padding(.horizontal, 25)
                        .padding(.vertical, 12)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue.opacity(0.7))
                        .cornerRadius(15)
                })
            }
            .padding(20)
            
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
