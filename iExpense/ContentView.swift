//
//  ContentView.swift
//  iExpense
//
//  Created by Mikhail on 10.07.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(.red)
                    }
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            }
            )
            .navigationTitle("iExpense")
        }
        .sheet(isPresented: $showingAddExpense, content: {
            AddView(expenses: self.expenses)
        })
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    func body1(amount: Int) {
        if amount < 10 {
                
        } else if amount < 100 {
              
        } else {
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
