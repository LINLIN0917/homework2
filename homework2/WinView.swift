//
//  WinView.swift
//  homework2
//
//  Created by Linlin on 2021/3/23.
//

import SwiftUI

struct WinView: View {
    @Binding var showWinView:Bool
    var body: some View {
        ZStack {
           Color.yellow
            VStack{
            Text("You Win")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
            Button(action: {
                showWinView = false
                
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

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(showWinView: .constant(true))
    }
}
