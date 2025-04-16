//
//  AddEventView.swift
//  Muckmuck
//
//  Created by Rama on 4/15/25.
//

import SwiftUI

struct AddEventView: View {
    @State var eventName: String
    @State private var participantCount = 2
    @State private var selectedDate = Date()
    @State var date: Date
    @State private var showDatePicker = false
    
    var body: some View {
        ZStack {
            Color.beerOrange.ignoresSafeArea()
            VStack {
                Image(.beer)
                    .resizable()
                    .frame(width: 146, height: 228)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.mainBounds.width, height: 200)
                        .foregroundStyle(.white.opacity(0.5))
                    VStack(spacing: 16) {
                        TextField("이벤트 제목", text: $eventName)
                            .background(.clear)
                            .cornerRadius(12)
                        Divider()
                        DatePicker("날짜 및 시간", selection: $date, displayedComponents: [.date, .hourAndMinute])
                            .datePickerStyle(.compact)
                        Divider()
                        Button {
                            // showLocationSearch.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                Text("위치")
                            }
                        }
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.mainBounds.width, height: 140)
                        .foregroundStyle(.white.opacity(0.5))
                    VStack(spacing: 16) {
                        Stepper(value: $participantCount, in: 1...20) {
                            Text("최소 인원 수: \(participantCount)명")
                        }
                        Divider()
                        Stepper(value: $participantCount, in: 1...20) {
                            Text("최대 인원 수: \(participantCount)명")
                        }
                    }
                }
                
                Button(action: {
                }) {
                    Text("참가하기")
                        .foregroundStyle(.white)
                }
                .frame(width: UIScreen.mainBounds.width - 32, height: 60)
                .background(.blue)
                .cornerRadius(40)
            }
        }
    }
}

#Preview {
    @State var previewEventName = "지곡회관 학식"
    AddEventView(eventName: previewEventName, date: Date())
}
