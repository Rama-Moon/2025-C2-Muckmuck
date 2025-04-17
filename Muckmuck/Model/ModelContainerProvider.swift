//
//  ModelContainerProvider.swift
//  Muckmuck
//
//  Created by Rama on 4/16/25.
//

import SwiftData

@MainActor
class ModelContainerProvider {
    static let shared: ModelContainer = {
        do {
            return try ModelContainer(for: Event.self, User.self)
        } catch {
            fatalError("\(error)")
        }
    }()
}
