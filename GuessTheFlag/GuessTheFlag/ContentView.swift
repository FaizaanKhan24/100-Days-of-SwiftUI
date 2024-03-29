//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Faizaan Khan on 11/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var alertMessage = ""
    @State private var scoreColor: Color = Color.white
    
    @State private var isGameOver = false
    @State var gameCounter = 0
    
    @State private var rotationAmount = 0.0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    struct FlagImage : View{
        var imageName: String
        
        var body: some View{
            Image(imageName)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Spacer()
                Spacer()
                
                VStack{
                    Text("Select the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
//                        rotationAmount += 360
                    } label: {
                        FlagImage(imageName: countries[number])
                            .rotation3DEffect(.degrees( number == correctAnswer ?  rotationAmount : 0), axis: (x:0, y:1, z:0))
                            .opacity(isShowScore && number != correctAnswer ? 0.25 : 1)
                            .scaleEffect(isShowScore && number != correctAnswer ? 0.75: 1)
                            .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                
                Spacer()
                
                VStack{
                    Text("Your Score : ")
                        .foregroundColor(.white)
                        .font(.subheadline.bold())
                    +
                    Text("\(score)")
                        .foregroundColor(scoreColor)
                        .font(.subheadline.bold())
                }
            }
        }
        .alert(scoreTitle, isPresented: $isShowScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("""
                \(alertMessage)
                Your score is \(score)
                """)
        }
        .alert("Game Over!", isPresented: $isGameOver){
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is: \(score)")
        }
    }
    
    func flagTapped(_ number: Int){
        withAnimation(){
            rotationAmount += 360
        }
        if number == correctAnswer{
            scoreTitle = "Correct"
            withAnimation(.easeIn(duration: 0.5)){
                score += 1
                scoreColor = .green
            }
            alertMessage = "Awesome! That's the correct answer"
        }
        else{
            scoreTitle = "Wrong"
            withAnimation(.easeOut(duration: 0.5)){
                score -= 1
                scoreColor = .red
            }
            alertMessage = "Wrong! Thats the flag of \(countries[number])"
        }
        
        withAnimation(.easeIn(duration: 1)){
            isShowScore = true
        }
        gameCounter += 1
        if (gameCounter >= 8){
            isGameOver = true
        }
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame(){
        isGameOver = false
        gameCounter = 0
        score = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
