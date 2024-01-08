//
//  AddView.swift
//  TodoApp_MVVM
//
//  Created by Tchio Idriss  on 26.12.23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListviewModel
    var backgroundColor = Color(UIColor.secondarySystemBackground)
    @State var newItem:String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //-------------------------------------------------------------------------
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter something here...", text:  $newItem)
                    .padding(.horizontal)
                    .frame(width:.infinity,  height: 55)
                    .background(Color(backgroundColor))
                .cornerRadius(10.0)
                
                Button(action: OnSaveButton, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .frame(maxWidth: 500)
            .padding(14)
   }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    //-------------------------------------------------------------------------
    func OnSaveButton(){
        if textIsAppropiate() {
            listViewModel.addItem(title: newItem)
            presentationMode.wrappedValue.dismiss()
        }
       
    }
    
    //-------------------------------------------------------------------------
    func textIsAppropiate() -> Bool {
        if newItem.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characteres long 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    //-------------------------------------------------------------------------
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListviewModel())
    
}
