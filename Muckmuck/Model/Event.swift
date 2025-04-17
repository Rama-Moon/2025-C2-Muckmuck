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
class Event {
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

let upcomingEvents: [Event] = [
    Event(
        id: UUID(),
        eventName: "지곡회관 밥약",
        category: .meal,
        date: .now.addingTimeInterval(3600),
        location: "지곡회관",
        minNum: 2,
        maxNum: 6,
        host: User(nickname: "Alice"),
        attendant: [],
        isMine: false
    ),
    Event(
        id: UUID(),
        eventName: "도서관 스터디",
        category: .coffee,
        date: .now.addingTimeInterval(7200),
        location: "정보도서관 2층",
        minNum: 3,
        maxNum: 5,
        host: User(nickname: "Bob"),
        attendant: [],
        isMine: false
    ),
    Event(
        id: UUID(),
        eventName: "공원 산책모임",
        category: .drink,
        date: .now.addingTimeInterval(10800),
        location: "대운동장 앞",
        minNum: 2,
        maxNum: 4,
        host: User(nickname: "Charlie"),
        attendant: [],
        isMine: false
    )
]

let myEvents: [Event] = [
    Event(
        id: UUID(),
        eventName: "내 밥약",
        category: .meal,
        date: .now.addingTimeInterval(14400),
        location: "학생회관",
        minNum: 2,
        maxNum: 4,
        host: User(nickname: "Me"),
        attendant: [],
        isMine: true
    ),
    Event(
        id: UUID(),
        eventName: "내 스터디",
        category: .coffee,
        date: .now.addingTimeInterval(18000),
        location: "제2과학관",
        minNum: 3,
        maxNum: 6,
        host: User(nickname: "Me"),
        attendant: [],
        isMine: true
    ),
    Event(
        id: UUID(),
        eventName: "내 맥주타임",
        category: .drink,
        date: .now.addingTimeInterval(21600),
        location: "맥주집 앞",
        minNum: 4,
        maxNum: 8,
        host: User(nickname: "Me"),
        attendant: [],
        isMine: true
    )
]
