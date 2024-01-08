//
//  ItemModel.swift
//  TodoApp_MVVM
//
//  Created by Tchio Idriss  on 27.12.23.
//

import Foundation

/*
 *  Le protocole Codable est utilisé pour la sérialisation et la désérialisation de données.
 * L'utilisation du protocole Codable dans SwiftUI est souvent liée au chargement et à la
 * sauvegarde de données persistantes
 */
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateICompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    
}

