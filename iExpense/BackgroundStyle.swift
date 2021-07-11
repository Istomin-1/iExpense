//
//  BackgroundStyle.swift
//  iExpense
//
//  Created by Mikhail on 10.07.2021.
//

import SwiftUI

struct BackgroundStyle: ViewModifier {
    
//
//    func body(content: Content, amount: Int) -> some View {
//        if amount < 10 {
//            return content
//                .font(.title)
//                .foregroundColor(.blue)
//        } else if amount < 100 {
//            return content
//                .font(.title2)
//                .foregroundColor(.green)
//        } else {
//            return content
//                .font(.title2)
//                .foregroundColor(.red)
//        }
//    }
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}


