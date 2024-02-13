//
//  ContentView.swift
//  Pinch
//
//  Created by Deep Patel on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    
//     MARK :- PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    
    var body: some View {
        NavigationView{
            
            
            ZStack{
                // MARK :_ PAGE
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(1)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2,y: 2)
                    .opacity(isAnimating ? 1:0)
                    .scaleEffect(imageScale)
                // tap gesture
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }else{
                            withAnimation(.spring()){
                                imageScale = 1
                            }
                        }
                    })
                    .animation(.linear(duration: 1), value: isAnimating)
            } // Zstack
            
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            })
            
        } // navigation views
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
