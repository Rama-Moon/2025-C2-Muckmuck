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
    
    private var myEvents: [Event] {
        muckEvents.filter { $0.isMine }
    }
    private var upcomingEvents: [Event] {
        muckEvents.filter { !$0.isMine }
    }
    
    @State private var selectedEvent: Event?
    @State private var showDetail = false
    @State private var showDialog = false
    
    var body: some View {
        NavigationStack {
            navigationView
            upcomingEventView
            myEventView
            Spacer()
                .navigationDestination(for: Category.self) { category in
                    AddEventView(category: category)
                }
                .navigationDestination(for: Event.self) { event in
                    EventDetailView(event: event)
                }
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
                    let upcomingEvents = muckEvents.filter { !$0.isMine }
                    let groupRange: [Int] = Array(0..<Int(ceil(Double(upcomingEvents.count) / 3.0)))
                    ForEach(groupRange, id: \.self) { columnIndex in
                        let startIndex = columnIndex * 3
                        let group = Array(upcomingEvents[startIndex..<min(startIndex + 3, upcomingEvents.count)])
                        
                        VStack(spacing: 8) {
                            ForEach(group) { event in
                                NavigationLink(value: event) {
                                    UpcomingEventItem(event: event)
                                        .frame(width: 362, height: 111)
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
            Button(action: {}) {
                Text("나의 모임")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    let myEvents = muckEvents.filter { $0.isMine }
                    ForEach(0...myEvents.count / 2, id: \.self) { groupIndex in
                        let startIndex = groupIndex * 2
                        let group = Array(myEvents[startIndex..<min(startIndex + 2, myEvents.count)])
                        
                        HStack(spacing: 12) {
                            ForEach(group) { event in
                                NavigationLink(value: event) {
                                    MyEventItem(event: event)
                                        .frame(width: 173, height: 173)
                                }
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
