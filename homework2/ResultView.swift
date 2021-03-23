//
//  ResultView.swift
//  homework2
//
//  Created by Linlin on 2021/3/21.
//

import SwiftUI

struct ResultView: View {
    @Binding var showResultView:Bool
    var body: some View {
        
            
        ZStack {
           Color.yellow
            VStack{
            Text("You Lose")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
            Button(action: {
                showResultView = false
                
            }, label: {
                Text("再來一局")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 5))
            })
        }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(showResultView: .constant(true))
    }
}
