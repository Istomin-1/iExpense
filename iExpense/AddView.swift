//
//  AddView.swift
//  iExpense
//
//  Created by Mikhail on 10.07.2021.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    @State private var showingError = false
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $showingError) {
                Alert(title: Text("Error"), message: Text("Invalid data entered. Required number."), dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                guard let actualAmount = Int(self.amount) else { showingError = true
                    return }
                let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                self.expenses.items.append(item)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
