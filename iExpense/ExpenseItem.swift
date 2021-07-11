//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mikhail on 10.07.2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
