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
            Button(action: {showResultView = false
            }, label: {
                Text("再來一局")
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
