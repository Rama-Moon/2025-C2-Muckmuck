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
            
            VStack {
                Image(.coffee)
                    .resizable()
                    .frame(width: 220, height: 175)
                
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
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.5))
                        .cornerRadius(25)
                        .frame(height: 123)
                        .padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack(alignment: .center, spacing: 16) {
                            attendant
                            attendant
                            attendant
                        }
                        .padding(16)
                    }
                    .frame(width: UIScreen.mainBounds.width - 32, height: 123)
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
    
    private var attendant: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundStyle(.gray)
                    .frame(width: 62)
                Text("R")
                    .font(.largeTitle)
            }
            Text("Rama")
                .font(.caption)
        }
    }
}

#Preview {
    EventDetailView()
}
