//
//  MyEventItem.swift
//  Muckmuck
//
//  Created by Rama on 4/18/25.
//

import SwiftUI

struct MyEventItem: View {
    var event: Event
    
    var body: some View {
        Button(action: {}) {
            HStack {
                VStack(alignment: .leading) {
                    Group {
                        Text("\(event.eventName)의 모임")
                            .font(.title2)
                            .bold()
                        Text("\(DateFormatter.eventFormat.string(from: event.date))")
                            .font(.footnote)
                            .bold()
                        Spacer()
                        Text("\(event.minNum)명에서 \(event.maxNum)명")
                            .font(.footnote)
                            .bold()
                    }
                    .foregroundStyle(.white)
                }
                Spacer()
            }
            .padding(12)
        }
        .background(event.category.eventColor)
        .cornerRadius(20)
    }
}
