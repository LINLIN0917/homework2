//
//  ContentView.swift
//  homework2
//
//  Created by Linlin on 2021/3/18.
//

import SwiftUI


struct ContentView: View {
    @State private var showWinView = false
    @Binding var showContentView:Bool
    @State private var showGameOverView = false
    @State private var showResultView = false
    @State private var coin = 1
    @State private var win = 0
    @State private var result = 0
    @State private var round = 0
    @State private var point = 0//99的點數
    @State var count = 10//目前抽到張數
    @State var cards = [Card]()//製造52張牌
    @State var computerCard = [Card]()//電腦手牌
    @State var playerCard = [Card]()//玩家手牌
    @State private var choose20 = true
    @State private var choose10 = true
    @State private var gameStart = false
    let suits = ["Clubs","Diamonds","Hearts","Spades"]
    let ranks = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
                 "12", "13"]
    func creatCards() -> [Card] {
        for suit in suits{
            for rank in ranks{
                var card = Card()
                card.suit = suit
                card.rank = rank
                cards.append(card)
            }
        }
        cards.shuffle()//洗牌
        return cards
    }
    
    func creatPlayerCards()->[Card]{
        playerCard.append(contentsOf: cards[0...10])
        //0~4player 5~9computer
        return playerCard
    }
    func playerAdd( count: inout Int,x:Int)->(Card){
        playerCard[x] = cards[count]
        count += 1
        return (playerCard[x])
    }
    func check(count: inout Int, point: inout Int,x:Int)->([Card],Int){
        if count == 51 {
            count = 0
            cards.shuffle()
        }
        if x != 5{
            if point > 99{
            coin-=100
            if coin == 0 {
                showGameOverView = true
            }
            else{
                point = 0
                showResultView = true
                gameStart = false
                
                
            }
        }
        }
        if x == 5{
            if point > 99{
                coin+=100
                gameStart = false
                point = 0
                showWinView = true

                
                
            }
        }
        
        return (cards,win)
    }
    func game99(x:Int){
        playerCard[10] = playerCard[x]
        gameStart = true
        switch playerCard[x].rank {
        case "1":
            if playerCard[x].suit == "Spades" {
                point = 0
            }
            else{
                point+=1
            }
        case "2":
            point+=2
        case "3":
            point+=3
        case "4":
            break
        case "5":
            break
        case "6":
            point+=6
        case "7":
            point+=7
        case "8":
            point+=8
        case "9":
            point+=9
        case "10":
            if x == 5 {
                point+=10
            }
            else{
                choose10 = false
            }
        case "11":
            break
        case "12":
            if x == 5 {
                point+=20
            }
            else{
                choose20 = false
            }
        case "13":
            point = 99
        default:
            point+=0
        }
        
    }
    func computerAdd() {
        game99(x: 5)
        playerAdd(count: &count, x: 5)
    }
    func overCard(x: Int) -> Card {
        playerCard[10] = playerCard[x]
        return playerCard[10]
    }
    var body: some View {
        if coin == 1 {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .opacity(0.7)
                VStack{
                    Text("Choose Coin:")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                    Button(action: {coin = 100
                        creatCards()
                        creatPlayerCards()
                    }, label: {
                        Text("100")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 5))
                    })
                    Button(action: {coin = 200
                        creatCards()
                        creatPlayerCards()
                    }, label: {
                        Text("200")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 5))
                    })
                    Button(action: {coin = 300
                        creatCards()
                        creatPlayerCards()
                    }, label: {
                        Text("300")
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
        else{
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .opacity(0.7)
                VStack{
                        Text("剩\(52-count)張牌")
                            .font(.title)
                            .bold()
                        Text("Coin:\(coin)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                        Text("Point:\(point)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                        Text("對手")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        HStack{
                            ExtractedView()
                            ExtractedView()
                            ExtractedView()
                            ExtractedView()
                            ExtractedView()
                        }
                        Spacer()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        if gameStart {
                            Image(playerCard[10].suit+playerCard[10].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height:130)
                                .scaledToFit()
                        }
                        Spacer()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("你")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                        HStack{
                            Button(action: {game99(x: 0)
                                playerAdd(count: &count, x: 0)
                                check(count: &count,point: &point,x: 0)
                                if choose10 && choose20 {
                                    computerAdd()
                                    check(count: &count,point: &point,x: 5)
                                }
                            }, label: {
                                Image(playerCard[0].suit+playerCard[0].rank)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 70, height:130)
                                    .scaledToFit()
                            })
                            
                            Button(action: {
                                game99(x: 1)
                                playerAdd(count: &count, x: 1)
                                
                                check(count: &count,point: &point,x: 1)
                                if choose10 && choose20 {
                                    computerAdd()
                                    check(count: &count,point: &point,x: 5)
                                }
                            }, label: {
                                Image(playerCard[1].suit+playerCard[1].rank)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 70, height:130)
                                    .scaledToFit()
                                
                            })
                            
                            Button(action: {
                                game99(x: 2)
                                playerAdd(count: &count, x: 2)
                                check(count: &count,point: &point,x: 0)
                                if choose10 && choose20 {
                                    computerAdd()
                                    check(count: &count,point: &point,x: 5)
                                }
                            }, label: {
                                Image(playerCard[2].suit+playerCard[2].rank)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 70, height:130)
                                    .scaledToFit()
                                
                            })
                            
                            Button(action:{
                                game99(x: 3)
                                playerAdd(count: &count, x: 3)
                                
                                check(count: &count,point: &point,x: 0)
                                if choose10 && choose20 {
                                    computerAdd()
                                    check(count: &count,point: &point,x: 5)
                                }
                            }, label: {
                                Image(playerCard[3].suit+playerCard[3].rank)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 70, height:130)
                                    .scaledToFit()
                                
                            })
                            
                            Button(action: {game99(x: 4)
                                playerAdd(count: &count, x: 4)
                                check(count: &count,point: &point,x: 0)
                                if choose10 && choose20 {
                                    computerAdd()
                                    check(count: &count,point: &point,x: 5)
                                }
                            }, label: {
                                Image(playerCard[4].suit+playerCard[4].rank)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 70, height:130)
                                    .scaledToFit()
                                
                            })
                            
                            
                            
                        }
                    }
                    if choose20 == false{
                        VStack{
                            Button(action: {choose20 = true
                                point+=20
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                                
                                
                            }, label: {
                                Text("+20")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .overlay(
                                        Rectangle()
                                            .stroke(Color.black, lineWidth: 5))
                            })
                            Button(action: {choose20 = true
                                point-=20
                                if point<0 {
                                    point = 0
                                }
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }, label: {
                                Text("-20")
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
                    if choose10 == false{
                        VStack{
                            Button(action: {choose10 = true
                                point += 10
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }, label: {
                                Text("+10")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white)
                                    .overlay(
                                        Rectangle()
                                            .stroke(Color.black, lineWidth: 5))
                            })
                            Button(action: {choose10 = true
                                point -= 10
                                if point<0 {
                                    point = 0
                                }
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }, label: {
                                Text("-10")
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
                
                }.edgesIgnoringSafeArea(.all)
        EmptyView().sheet(isPresented: $showWinView, content: {
        WinView(showWinView: $showWinView)})
            EmptyView().sheet(isPresented: $showResultView, content: {
                                            ResultView(showResultView: $showResultView)})
                    
                    EmptyView().sheet(isPresented: $showGameOverView, content: {
                        GameOverView(showGameOverView: $showGameOverView)
            })
                
        }
            }
        }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView(showContentView: .constant(true))
                ContentView(showContentView: .constant(true))
                    .preferredColorScheme(.dark)
                
            }
        }
    }
    
    struct ExtractedView: View {
        var body: some View {
            Image("back")
                .resizable()
                .background(Color.white)
                .frame(width: 70, height:130)
                .scaledToFit()
        }
    }
