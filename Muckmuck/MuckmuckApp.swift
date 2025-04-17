//
//  MuckmuckApp.swift
//  Muckmuck
//
//  Created by Rama on 4/14/25.
//

import SwiftUI
import SwiftData

@main
struct MuckmuckApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(ModelContainerProvider.shared)
    }
}
