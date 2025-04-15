//
//  HomeView.swift
//  Muckmuck
//
//  Created by Rama on 4/14/25.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    /// Label에서 Text와 Icon을  나란히 배치하는 커스텀
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "M월 d일 (E) HH:mm"
    return formatter
}()

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("MuckMuck")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button("모임 추가하기") {}
            }
            .padding()
            
            upcomingEventView
                .padding([.leading, .bottom])
            
            myEventView
                .padding([.leading, .bottom])
            
            Spacer()
        }
    }
    
    private var upcomingEventView: some View {
        VStack(alignment: .leading) {
            Button(
                action: {},
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
                LazyHStack(spacing: 12) {
                    let groupCount = upcomingEvents.count / 3
                    
                    ForEach(0..<groupCount, id: \.self) { columnIndex in
                        
                        let startIndex = columnIndex * 3
                        
                        let group = Array(upcomingEvents[startIndex..<min(startIndex + 3, upcomingEvents.count)])
                        
                        VStack(spacing: 8) {
                            ForEach(group) { event in
                                UpcomingItemView(event: event)
                                    .frame(width: 362, height: 111)
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
            }
            .frame(height: 349)
            .scrollTargetBehavior(.viewAligned)
        }
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
                    ForEach(0..<myEvents.count / 2, id: \.self) { groupIndex in
                        let startIndex = groupIndex * 2
                        let group = Array(myEvents[startIndex..<min(startIndex + 2, myEvents.count)])
                        HStack(spacing: 12) {
                            ForEach(group) { event in
                                MyItemView(event: event)
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
    }
    
    struct MyItemView: View {
        let event: EventModel
        
        var body: some View {
            Button(action: {}) {
                HStack {
                    VStack(alignment: .leading) {
                        Group {
                            Text("\(event.host)의 모임")
                                .font(.title2)
                                .bold()
                            Text(dateFormatter.string(from: event.date))
                                .font(.footnote)
                                .bold()
                            Spacer()
                            Text("\(event.minMember)명에서 \(event.maxMember)명")
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
    
    struct UpcomingItemView: View {
        let event: EventModel
        
        var body: some View {
            Button(
                action: {},
                label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Group {
                                Text("\(event.host)의 모임")
                                    .font(.title2)
                                    .bold()
                                Text(dateFormatter.string(from: event.date))
                                    .font(.footnote)
                                    .bold()
                                Spacer()
                                Text("\(event.minMember)명에서 \(event.maxMember)명")
                                    .font(.footnote)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                        }
                        Spacer()
                        Image(event.category == .meal ? .meal :
                                event.category == .coffee ? .coffee : .beer)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    }
                    .padding(12)
                }
            )
            .background(event.category.eventColor)
            .cornerRadius(20)
        }
    }
}

#Preview {
    HomeView()
}
