//
//  DateFormatter+.swift
//  Muckmuck
//
//  Created by Rama on 4/17/25.
//

import Foundation

extension DateFormatter {
    static let eventFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M월 d일 (E) HH:mm"
        return formatter
    }()
}
