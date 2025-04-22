//
//  AddEventView.swift
//  Muckmuck
//
//  Created by Rama on 4/15/25.;
//

import SwiftUI

struct AddEventView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    let category: Category
    @State private var eventName: String = ""
    @State private var date: Date? = nil
    @State private var minNum: Int = 1
    @State private var maxNum: Int = 1
    @State private var showDatePicker = false
    
    var body: some View {
        ZStack {
            category.eventColor.ignoresSafeArea()
            VStack {
                Image(category.rawValue)
                    .resizable()
                    .frame(height: 160)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.mainBounds.width-32, height: 200)
                        .foregroundStyle(.white.opacity(0.5))
                    VStack(spacing: 16) {
                        TextField("\($eventName)", text: $eventName, prompt: Text("모임 이름"))
                            .background(.clear)
                            .cornerRadius(12)
                            .multilineTextAlignment(.center)
                            .font(.title)
                        
                        Divider()
                        
                        Button(action: {
                            showDatePicker.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "calendar.badge.plus")
                                if let selectedDate = date {
                                    Text("\(DateFormatter.eventFormat.string(from: selectedDate))")
                                } else {
                                    Text("날짜 및 시간")
                                        .font(.title2)
                                }
                            }
                        })
                        
                        Divider()
                        Button {
                        } label: {
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                Text("위치")
                                    .font(.title2)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: UIScreen.mainBounds.width - 32, height: 140)
                        .foregroundStyle(.white.opacity(0.5))
                    VStack(spacing: 16) {
                        Stepper(value: $minNum, in: 1...20) {
                            Text("최소 인원: \(minNum)명")
                                .font(.title)
                        }.frame(width:UIScreen.mainBounds.width - 100)
                        Divider()
                        Stepper(value: $maxNum, in: 1...20) {
                            Text("최대 인원: \(maxNum)명")
                                .font(.title)
                        }
                        .frame(width:UIScreen.mainBounds.width - 100)
                    }
                }
                .padding([.horizontal, .bottom])
                .sheet(isPresented: $showDatePicker) {
                    VStack {
                        if let bindingDate = Binding($date) {
                            DatePicker("날짜 및 시간", selection: bindingDate, displayedComponents: [.date, .hourAndMinute])
                                .datePickerStyle(.compact)
                                .padding()
                        } else {
                            // 최초 nil일 때 기본값 설정
                            DatePicker("날짜 및 시간", selection: Binding(
                                get: { Date() },
                                set: { newDate in date = newDate }
                            ), displayedComponents: [.date, .hourAndMinute])
                            .padding()
                        }
                    }
                    .presentationDetents([.height(200)])
                }
                
                Button(
                    action: {
                        let dummyUser = User(nickname: "Rama")
                        modelContext.insert(dummyUser)
                        
                        let newEvent = Event(
                            eventName: eventName,
                            category: category,
                            date: date ?? Date(),
                            location: "미정",
                            minNum: minNum,
                            maxNum: maxNum,
                            host: dummyUser,
                            attendant: [],
                            isMine: true
                        )
                        modelContext.insert(newEvent)
    
                    do {
                        try modelContext.save()
                        print("✅ 이벤트 저장 성공: \(newEvent.eventName)")
                        dismiss()
                    }
                    catch {
                        print("\(error)")
                    }
                }) {
                    Text("참가하기")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    AddEventView(category: .coffee)
}
