//
//  File.swift
//  Muckmuck
//
//  Created by Rama on 4/16/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Event: Identifiable {
    var id: UUID
    var eventName: String
    var category: Category
    var date: Date
    var location: String
    var minNum: Int
    var maxNum: Int
    var host: User
    var attendant: [User]
    var isMine: Bool
    
    init(
        id: UUID,
        eventName: String,
        category: Category,
        date: Date,
        location: String,
        minNum: Int,
        maxNum: Int,
        host: User,
        attendant: [User],
        isMine: Bool
    ) {
        self.id = id
        self.eventName = eventName
        self.category = category
        self.date = date
        self.location = location
        self.minNum = minNum
        self.maxNum = maxNum
        self.host = host
        self.attendant = attendant
        self.isMine = isMine
    }
}

enum Category: String, Codable, CaseIterable {
    case meal
    case coffee
    case drink
}

extension Category {
    var eventColor: Color {
        switch self {
        case .meal: return .mealGreen
        case .coffee: return .coffeeBrown
        case .drink: return .beerOrange
        }
    }
}
