//
//  User.swift
//  Muckmuck
//
//  Created by Rama on 4/16/25.
//

import Foundation
import SwiftData

@Model
class User: Identifiable {
    var id: UUID
    var nickname: String

    init(
        id: UUID = UUID(),
        nickname: String
    ) {
        self.id = id
        self.nickname = nickname
    }
}
