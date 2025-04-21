//
//  HomeView.swift
//  Muckmuck
//
//  Created by Rama on 4/14/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var muckEvents: [Event]
    
    @State private var selectedEvent: Event?
    @State private var showDetail = false
    @State private var showDialog = false

    
    var body: some View {
        NavigationStack {
            navigationView
            upcomingEventView
            myEventView
            Spacer()
        }
    }
    
    private var navigationView: some View {
        HStack {
            Text("MuckMuck")
                .font(.largeTitle)
                .bold()
            Spacer()
            Button("모임 만들기") {
                showDialog = true
            }
            .confirmationDialog(
                "모임을 선택해주세요",
                isPresented: $showDialog,
                titleVisibility: .visible
            ) {
                NavigationLink(value: Category.meal) {
                    Text("밥")
                }
                NavigationLink(value: Category.coffee) {
                    Text("커피")
                }
                NavigationLink(value: Category.drink) {
                    Text("술")
                }
                Button("취소", role: .cancel) {}
            }
            .navigationDestination(for: Category.self) { category in
                AddEventView(category: category)
            }
        }
        .padding()
    }
    
    private var upcomingEventView: some View {
        VStack(alignment: .leading) {
            Button(
                action: {
                },
                label: {
                    Label(title: {
                        Text("다가오는 모임")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.black)
                    }, icon: {
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    })
                    .labelStyle(TrailingIconLabelStyle())
                }
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    let groupCount = Int(ceil(Double(muckEvents.count) / 3.0))
                    ForEach(0..<groupCount, id: \.self) { columnIndex in
                        let startIndex = columnIndex * 3
                        let group = Array(muckEvents[startIndex..<min(startIndex + 3, muckEvents.count)])
                        
                        VStack(spacing: 8) {
                            ForEach(group) { event in
                                UpcomingEventItem(event: event)
                                    .frame(width: 362, height: 111)
                                    .onTapGesture {
                                        print("Tapped: \(event.eventName)")
                                        selectedEvent = event
                                        showDetail = true
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
            }
            .frame(height: 349)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding([.leading, .bottom])
    }
    
    private var myEventView: some View {
        VStack(alignment: .leading) {
            Button(
                action: {},
                label: {
                    Label(title: {
                        Text("나의 모임")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.black)
                    }, icon: {
                        Image(systemName: "chevron.right")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    })
                    .labelStyle(TrailingIconLabelStyle())
                }
            )
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(0...muckEvents.count / 2, id: \.self) { groupIndex in
                        let startIndex = groupIndex * 2
                        let group = Array(muckEvents[startIndex..<min(startIndex + 2, muckEvents.count)])
                        
                        HStack(spacing: 12) {
                            ForEach(group) { event in
                                MyEventItem(event: event)
                                    .frame(width: 173, height: 173)
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
            }
            .frame(height: 173)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding([.leading, .bottom])
    }
    
    func insertDummy() {
        let host = User(nickname: "Rama")
        modelContext.insert(host)
        
        let dummyEvents = [
            Event(
                id: UUID(),
                eventName: "저녁 먹을 사람 구함",
                category: .meal,
                date: .now.addingTimeInterval(3600),
                location: "지곡회관",
                minNum: 2,
                maxNum: 6,
                host: host,
                attendant: [],
                isMine: true
            )
        ]
        
        for event in dummyEvents {
            modelContext.insert(event)
        }
    }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

#Preview {
    HomeView()
}
