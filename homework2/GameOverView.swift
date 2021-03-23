//
//  GameOverView.swift
//  homework2
//
//  Created by Linlin on 2021/3/21.
//

import SwiftUI

struct GameOverView: View {
    @State private var showFirstView = false
    @Binding var showGameOverView:Bool
    var body: some View {
        
            ZStack {
                Image("gameover")
                   .resizable()
                   .scaledToFill()
                   .frame(minWidth: 0, maxWidth: .infinity)
                 .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                        .frame(width: 100, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("GAME OVER")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 5))
                Spacer()
                    .frame(width: 200, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Button(action: {showFirstView = true}, label: {
                        Text("我不服輸，再玩一次！")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 5))
                    }).fullScreenCover(isPresented: $showFirstView, content: {
                        FirstView()
                    })
                    
                }
               
            
    }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(showGameOverView: .constant(true))
    }
}
