//
//  ContentView.swift
//  Memorize
//
//  Created by Angela Wang on 10/10/21.
//

import SwiftUI

var faces = ["😃","😁","🥲","🥰","😚","😖","😦","😪","🤕","🤔"]
var animals = ["🐶","🐱","🐭","🐹","🐷","🦊","🐼","🐨","🐝","🦄"]
var plant = ["🌵","🌼","🌸","🌺","🌲","🌹","🍀","🍁","🌳","🌿"]
 
struct ContentView: View {
    
    @State var emojis = faces
    @State var emojiCount = 10
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(.red)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            Spacer()
            
            HStack() {
                add
                Spacer()
                theme1
                theme2
                theme3
                Spacer()
                remove
            }
            .font(.largeTitle)
            //.padding(.horizontal)
            Spacer(minLength: 20)
        }
        .padding(.horizontal)
        
    }

    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var theme1: some View {
        Button(action:{
            emojis = faces.shuffled()
        }, label: {
            VStack{
                Image(systemName: "face.smiling")
                Text("Faces").font(.subheadline)
            }
        })
    }
    var theme2: some View {
        Button(action:{
            emojis = animals.shuffled()
        }, label: {
            VStack{
                Image(systemName: "ant.circle")
                Text("Animals").font(.subheadline)
            }
        })
    }
    var theme3: some View {
        Button(action:{
            emojis = plant.shuffled()
        }, label: {
            VStack{
                Image(systemName: "questionmark.circle")
                Text("Plants").font(.subheadline)
            }
        })
    }

    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
