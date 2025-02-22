//
//  EventSlideshowView.swift
//  Campus Navigator
//
//  Created by Kavinsha Chamod on 2025-02-21.
//

import SwiftUI

struct EventSlideshowView: View {
    let eventBanners = ["banner1", "banner2", "banner3", "banner4"]
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(0..<eventBanners.count, id: \.self) { index in
                    Image(eventBanners[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .shadow(radius: 4)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 200)
            .cornerRadius(12)
            
            .onAppear {
                startAutoSlide()
            }
        }
        .padding(.horizontal, 20)
    }
    
    private func startAutoSlide() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % eventBanners.count
            }
        }
    }
}
