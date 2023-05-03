//
//  ContentView.swift
//  Animating Circles
//
//  Created by Asadbek Nematov on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var scaleInOut = false
    @State var rotateInOut = false
    @State var moveInOut = false
    @State private var rotationAmount: Double = 0
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
            ZStack{
                
                //MARK: - Circles Set 1
                ZStack{
                    Circle().fill(.linearGradient(colors: [.green, .white], startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle().fill(.linearGradient(colors: [.purple, .white], startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.8)
                
                //MARK: - Circles Set 2
                ZStack{
                    Circle().fill(.linearGradient(colors: [.cyan, .white], startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle().fill(.linearGradient(colors: [.red, .white], startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.8).rotationEffect(.degrees(60))
                
                //MARK: - Circles Set 3
                ZStack{
                    Circle().fill(.linearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? -60 : 0)
                    Circle().fill(.linearGradient(colors: [.yellow, .white], startPoint: .bottom, endPoint: .top))
                        .frame(width: 120, height: 120)
                        .offset(y: moveInOut ? 60 : 0)
                }.opacity(0.8).rotationEffect(.degrees(120))
                
            }
            
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/10)
            .animation(Animation
                .easeInOut(duration: 0.1)
                .repeatForever(autoreverses: true)
                .speed(1/9),
                       value: rotationAmount)
            .onAppear {
                rotationAmount = 3
                moveInOut.toggle()
                scaleInOut.toggle()
                rotateInOut.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
