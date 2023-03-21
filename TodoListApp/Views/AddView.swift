//
//  AddView.swift
//  TodoListApp
//
//  Created by Adi Amoyal on 21/03/2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(.gray.opacity(0.18))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsValid() {
            listViewModel.saveButtonPressed(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
