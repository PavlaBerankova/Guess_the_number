//
//  main.swift
//  Guess_the_number
//
//  Created by Pavla Beránková on 23.11.2022.
//

import Foundation

extension String {
    func trimed() -> String {
        self.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// intro
print("------------------------------------------")
print("🎲 Welcome to the game: Guess a number 🎲")
print("------------------------------------------")

game()

func playAgain() { // repeat function
    let userAnswer = String(readLine() ?? "").lowercased().trimed()
    switch userAnswer {
     case "yes":
       print("------------------------------------------")
       print("🟩🟩🟩🟩🟩🟩    NEW GAME    🟩🟩🟩🟩🟩🟩")
       print("------------------------------------------")
       game()
     case "no":
       print("------------------------------------------")
       print("⬜️⬜️⬜️⬜️⬜️⬜️    END GAME    ⬜️⬜️⬜️⬜️⬜️⬜️")
       print("------------------------------------------")
       exit(0)
     default:
       print("Error! Try again: YES or NO")
       print("------------------------------------------")
       playAgain()
     }
}

func game() { // game function
    let secretNumber = Int.random(in: 1...100) // generate a secret number
    print("🤔 Guess a number from 1-100")
    print("🧠 Choose difficult: EASY or HARD?")
    // print(secretNumber) - hidden(only for testing)
    var attempt = 0
    let difficult = String(readLine() ?? "").lowercased().trimed() // choice of difficulty
    switch difficult {
    case "easy":
      attempt = 10
      print("🤖 You have a \(attempt) attempts")
    case "hard":
      attempt = 5
      print("🤖 You have a \(attempt) attempts")
    default:
      print("Error! Try again: EASY or HARD")
      playAgain()
    }
    
    print("✍🏻 Write your number:")
    print("------------------------------------------")
    while attempt > 0 {
        let userNumber = Int(readLine() ?? "0") ?? 0
        attempt -= 1
        if userNumber > secretNumber {
            print("❌ Your number is TOO HIGH ⬆️")
            print("🤖 \(attempt) attempts left.")
            print("✍🏻 Try again:")
            print("------------------------------------------")
        } else if userNumber < secretNumber {
            print("❌ Your number is TOO LOW ⬇️")
            print("🤖 \(attempt) attempts left.")
            print("✍🏻 Try again:")
            print("------------------------------------------")
        } else {
            print("🟨🟨🟨🟨🟨  YOU WIN!  🏆🏆🏆  🟨🟨🟨🟨🟨")
            print()
            print("     ❔ THE SECRET NUMBER IS \(secretNumber) ❔")
            print()
            print("         🎉 CONGRATULATIONS! 🎉          ")
            print("__________________________________________")
            print("------------------------------------------")
            print("🔁 Do you want to play again?")
            playAgain()
        }
    } //end while
    
    print("🟥🟥🟥🟥🟥  YOU LOSE! 👎👎👎  🟥🟥🟥🟥🟥")
    print()
    print("      ❔ THE SECRET NUMBER IS \(secretNumber) ❔")
    print("__________________________________________")
    print("------------------------------------------")
    print("🔁 Do you want to play again?")
    playAgain()
} //end func game
    
   

