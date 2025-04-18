//
//  EventDetailView.swift
//  Muckmuck
//
//  Created by Rama on 4/15/25.
//

import SwiftUI

struct EventDetailView: View {
    var body: some View {
        ZStack {
            Color.coffeeBrown.ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Image(.coffee)
                        .resizable()
                        .frame(width: 220, height: 175)
                        .padding()
                    
                    VStack {
                        Group {
                            Text("Alex's")
                            Text("Party")
                        }
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                        
                        Group {
                            Text("Tue, September 2, 8.00PM")
                            Text("Brooklyn, NY")
                        }
                        .font(.title3)
                        .foregroundStyle(.white)
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                    }, label: {
                        Label(title: {
                            Text("참석")
                        }, icon: {
                            Image(systemName: "checkmark.circle")
                                .imageScale(.medium)
                        })
                        .labelStyle(.titleAndIcon)
                        .foregroundStyle(.white)
                    })
                    .frame(width: UIScreen.mainBounds.width - 32, height: 60)
                    .background(.black.opacity(0.3))
                    .cornerRadius(40)
                    .padding(.bottom)
                    
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white.opacity(0.5))
                            .cornerRadius(25)
                            .frame(height: 123)
                            .padding(.horizontal)
                        ScrollView(.horizontal) {
                            HStack(alignment: .center, spacing: 16) {
                                attendant
                            }
                            .padding(16)
                        }
                        .frame(width: UIScreen.mainBounds.width - 32, height: 123)
                    }
                    
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.5))
                        .cornerRadius(25)
                        .padding(.horizontal)
                        .frame(height: 300)
                }
            }
        }
    }
    
    private var attendant: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 62)
                Text("R")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            Text("Rama")
                .font(.caption)
        }
    }
}

#Preview {
    EventDetailView()
}
