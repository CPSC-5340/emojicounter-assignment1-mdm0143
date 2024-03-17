//
//  ContentView.swift
//  EmojiCounter
//
//  Created by Micah Moore on 3/17/24.
//

import SwiftUI

// EmojiCounter model struct
struct EmojiCounter: Identifiable, Equatable {
    let id: UUID
    var emoji: String
    var count: Int

    init(emoji: String, count: Int) {
        self.id = UUID()
        self.emoji = emoji
        self.count = count
    }
}

// The individual view for each emoji counter
struct EmojiCounterView: View {
    @Binding var emojiCounter: EmojiCounter
    
    var body: some View {
        HStack {
            Text(emojiCounter.emoji)
            Spacer()
            Text("Counter: \(emojiCounter.count)")
            Spacer()
            Button(action: {
                emojiCounter.count += 1
            }) {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
            }
            Button(action: {
                if emojiCounter.count > 10 {
                    emojiCounter.count -= 1
                }
            }) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
            }
        }
        .font(.title)
    }
}

// Main content view
struct ContentView: View {
    @State private var emojiCounters = [
        EmojiCounter(emoji: "🥳", count: -5),
        EmojiCounter(emoji: "🤔", count: -5),
        EmojiCounter(emoji: "😊", count: -5),
        EmojiCounter(emoji: "👑", count: -5),
        EmojiCounter(emoji: "😂", count: -5)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($emojiCounters) { $emojiCounter in
                    EmojiCounterView(emojiCounter: $emojiCounter)
                }
            }
            .navigationBarTitle("Emoji Counter")
        }
    }
}

// Preview provider for the ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




