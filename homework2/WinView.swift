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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
           Color.yellow
            VStack{
            Text("You Lose")
            Button(action: {showWinView = false
            }, label: {
                Text("再來一局")
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
