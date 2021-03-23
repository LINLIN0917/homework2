//
//  FirstView.swift
//  homework2
//
//  Created by Linlin on 2021/3/21.
//

import SwiftUI

struct FirstView: View {
    @State private var showContentView = false
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("99大亂鬥")
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
                Button(action: {showContentView = true}, label: {
                    Text("GAME START")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 5))
                })
                .padding()
                .fullScreenCover(isPresented: $showContentView, content: {
                    ContentView(showContentView: $showContentView)
                })
                Link(destination: URL(string: "https://zh.wikipedia.org/wiki/%E4%B9%9D%E4%B9%9D_(%E6%92%B2%E5%85%8B%E7%89%8C)")!, label: {
                    Text("規則說明")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 5)
                        )
                    
                })
                
                Spacer()
                    .frame(width: 100, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .frame(width: 414, height: 960, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Image("first").resizable()
                            .scaledToFill()
            )
            .clipped()
            
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
