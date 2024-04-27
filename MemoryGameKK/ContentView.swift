//
//  ContentView.swift
//  MemoryGameKK
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    let allCards: [[String]] = [
            ["👹","🥶","😂","😱","😍","😉","😇","🤣"],
            ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"],
            ["🍎","🍊","🍋","🍉","🍇","🍓","🍒","🥭"]
        ]
    @State var cardsContent: [String] = ["👹","🥶","😂","😱","😍","😉","😇","🤣"]

    @State private var currentThemeIndex = 0
    
    func getColorTheme() -> Color {
        switch currentThemeIndex {
        case 0:
            return .blue
        case 1:
            return .red
        case 2:
            return .yellow
        default:
            return .blue
        }
    }
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                ForEach(cardsContent, id: \.self) { cardContent in
                    CardView(content: cardContent, color: getColorTheme())
                        .aspectRatio(3/4, contentMode: .fit)
                }
            }
            .padding().foregroundColor(getColorTheme())
        }
    }
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            cardDisplay
            Spacer()
            HStack {
                adjustCardNumber(by: -2, symbol: "minus.circle")
                Spacer()
                adjustCardNumber(by: 2, symbol: "plus.circle")
            }
            .padding()
            HStack {
                ThemeView(icon: "flame", title: "Theme 1") {
                    self.changeTheme(index: 0)
                }
                ThemeView(icon: "cloud", title: "Theme 2") {
                    self.changeTheme(index: 1)
                }
                ThemeView(icon: "leaf", title: "Theme 3") {
                    self.changeTheme(index: 2)
                }
            }
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(action: {
            let adjustedCount = cardsContent.count + offset
            if adjustedCount >= 2 && adjustedCount <= 8 {
               if offset > 0 {
//                   addCards(offset)
               } else if offset < 0 {
//                   removeCards(-offset)
               }
            }
        }) {
            Image(systemName: symbol)
                .resizable()
                .frame(width: 30, height: 30)
        }
        .disabled(offset < 0 ? cardsContent.count <= 2 : cardsContent.count >= allCards.count)
    }
    
//    var addCards: (Int) -> Void {
//        { count in
//            for _ in 0..<count {
//                if var newCard = allCards.randomElement() {
//                    while(cardsContent.contains(newCard)) {
//                        newCard = allCards.randomElement()!
//                    }
//                    cardsContent.append(newCard)
//                }
//            }
//        }
//    }

//    var removeCards: (Int) -> Void {
//        { count in
//            let removeCount = min(count, cardsContent.count - 2)
//            cardsContent.removeLast(removeCount)
//        }
//    }

    func changeTheme(index: Int) {
        currentThemeIndex = index
        cardsContent = allCards[index]
        cardsContent.shuffle()
    }
}

#Preview {
    ContentView()
}
