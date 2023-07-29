import SwiftUI

struct ContentView: View {
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var round = 1
    @State private var playerMove = ""
    @State private var computerMove = ""
    @State private var result = ""
    
    let moves = ["Камень", "Ножницы", "Бумага"]
    
    var body: some View {
        ZStack {
            LinearGradient (gradient: Gradient (colors: [.white, .gray]), startPoint: .top,
                            endPoint: .bottom)
            .ignoresSafeArea()
            VStack {
                Text("Камень-Ножницы-Бумага")
                    .font(.largeTitle)
                    .padding(.top, 50)
                
                Text("Раунд \(round)")
                    .font(.title)
                    .padding(.top, 30)
                
                HStack {
                    VStack {
                        Text("Ваш выбор:")
                            .font(.headline)
                        Button(action: {
                            self.playerMove = "Камень"
                            self.playRound()
                        }) {
                            Image("stone")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        Button(action: {
                            self.playerMove = "Ножницы"
                            self.playRound()
                        }) {
                            Image("scissors")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        Button(action: {
                            self.playerMove = "Бумага"
                            self.playRound()
                        }) {
                            Image("paper")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                    }
                    VStack {
                        Text("Выбор компьютера:")
                            .font(.headline)
                        Text(computerMove)
                            .font(.largeTitle)
                            .padding(.top, 30)
                    }
                }.padding(.top, 50)
                
                Text(result)
                    .font(.title)
                    .padding(.top, 30)
                
                HStack {
                    VStack {
                        Text("Ваш счет:")
                            .font(.headline)
                        Text("\(playerScore)")
                            .font(.largeTitle)
                            .padding(.top, 10)
                    }
                    VStack {
                        Text("Счет компьютера:")
                            .font(.headline)
                        Text("\(computerScore)")
                            .font(.largeTitle)
                            .padding(.top, 10)
                    }
                }.padding(.top, 50)
            }
        }
    }
    
    func playRound() {
        computerMove = moves.randomElement()!
        if playerMove == computerMove {
            result = "Ничья!"
        } else if (playerMove == "Камень" && computerMove == "Ножницы") ||
                  (playerMove == "Ножницы" && computerMove == "Бумага") ||
                  (playerMove == "Бумага" && computerMove == "Камень") {
            result = "Вы выиграли!"
            playerScore += 1
        } else {
            result = "Вы проиграли!"
            computerScore += 1
        }
        
        round += 1
        if round == 11 {
            round = 0
            playerScore = 0
            computerScore = 0
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
