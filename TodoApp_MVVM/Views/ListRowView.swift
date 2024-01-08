//
//  ListRowView.swift
//  TodoApp_MVVM
//
//  Created by Tchio Idriss  on 26.12.23.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        
    }
}


let item1 = ItemModel(title: "title row 1", isCompleted: false)
let item2 = ItemModel(title: "Another row", isCompleted: true)

#Preview {
    ListRowView(item: item1)
}
