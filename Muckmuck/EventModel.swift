//
//  EventModel.swift
//  Muckmuck
//
//  Created by Rama on 4/15/25.
//

import SwiftUI

struct EventModel: Hashable, Identifiable {
    let id = UUID()
    let host: String
    let date: Date
    let isMine: Bool
    let category: EventCategory
    let maxMember: Int
    let minMember: Int
}

enum EventCategory {
    case meal
    case coffee
    case drink
    
    var eventColor: Color {
        switch self {
        case .meal:
            return .mealGreen
        case .coffee:
            return .coffeeBrown
        case .drink:
            return .beerOrange
        }
    }
}

let upcomingEvents: [EventModel] = [
    EventModel(host: "Alice", date: Date().addingTimeInterval(3600), isMine: true, category: .meal, maxMember: 5, minMember: 2),
    EventModel(host: "Bob", date: Date().addingTimeInterval(7200), isMine: false, category: .coffee, maxMember: 4, minMember: 2),
    EventModel(host: "Charlie", date: Date().addingTimeInterval(10800), isMine: true, category: .drink, maxMember: 6, minMember: 3),
    EventModel(host: "Diana", date: Date().addingTimeInterval(14400), isMine: false, category: .meal, maxMember: 8, minMember: 4),
    EventModel(host: "Eve", date: Date().addingTimeInterval(18000), isMine: true, category: .coffee, maxMember: 3, minMember: 1),
    EventModel(host: "Frank", date: Date().addingTimeInterval(21600), isMine: false, category: .drink, maxMember: 10, minMember: 5),
    EventModel(host: "Diana", date: Date().addingTimeInterval(14400), isMine: false, category: .meal, maxMember: 8, minMember: 4),
    EventModel(host: "Eve", date: Date().addingTimeInterval(18000), isMine: true, category: .coffee, maxMember: 3, minMember: 1),
    EventModel(host: "Frank", date: Date().addingTimeInterval(21600), isMine: false, category: .drink, maxMember: 10, minMember: 5)
]

let myEvents: [EventModel] = [
    EventModel(host: "Rama", date: Date().addingTimeInterval(3600), isMine: true, category: .meal, maxMember: 5, minMember: 2),
    EventModel(host: "Frank", date: Date().addingTimeInterval(7200), isMine: true, category: .coffee, maxMember: 4, minMember: 2),
    EventModel(host: "Eve", date: Date().addingTimeInterval(10800), isMine: true, category: .drink, maxMember: 6, minMember: 3),
    EventModel(host: "Bob", date: Date().addingTimeInterval(10800), isMine: true, category: .drink, maxMember: 6, minMember: 3),
    EventModel(host: "Alice", date: Date().addingTimeInterval(14400), isMine: true, category: .meal, maxMember: 8, minMember: 4)
]
