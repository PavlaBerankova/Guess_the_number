//
//  main.swift
//  Guess_the_number
//
//  Created by Pavla BerÃ¡nkovÃ¡ on 23.11.2022.
//

import Foundation

extension String {
    func trimed() -> String {
        self.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

// intro
print("------------------------------------------")
print("ð² Welcome to the game: Guess a number ð²")
print("------------------------------------------")

game()

func playAgain() { // repeat function
    let userAnswer = String(readLine() ?? "").lowercased().trimed()
    switch userAnswer {
     case "yes":
       print("------------------------------------------")
       print("ð©ð©ð©ð©ð©ð©    NEW GAME    ð©ð©ð©ð©ð©ð©")
       print("------------------------------------------")
       game()
     case "no":
       print("------------------------------------------")
       print("â¬ï¸â¬ï¸â¬ï¸â¬ï¸â¬ï¸â¬ï¸    END GAME    â¬ï¸â¬ï¸â¬ï¸â¬ï¸â¬ï¸â¬ï¸")
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
    print("ð¤ Guess a number from 1-100")
    print("ð§  Choose difficult: EASY or HARD?")
    // print(secretNumber) - hidden(only for testing)
    var attempt = 0
    let difficult = String(readLine() ?? "").lowercased().trimed() // choice of difficulty
    switch difficult {
    case "easy":
      attempt = 10
      print("ð¤ You have a \(attempt) attempts")
    case "hard":
      attempt = 5
      print("ð¤ You have a \(attempt) attempts")
    default:
      print("Error! Try again: EASY or HARD")
      playAgain()
    }
    
    print("âð» Write your number:")
    print("------------------------------------------")
    while attempt > 0 {
        let userNumber = Int(readLine() ?? "0") ?? 0
        attempt -= 1
        if userNumber > secretNumber {
            print("â Your number is TOO HIGH â¬ï¸")
            print("ð¤ \(attempt) attempts left.")
            print("âð» Try again:")
            print("------------------------------------------")
        } else if userNumber < secretNumber {
            print("â Your number is TOO LOW â¬ï¸")
            print("ð¤ \(attempt) attempts left.")
            print("âð» Try again:")
            print("------------------------------------------")
        } else {
            print("ð¨ð¨ð¨ð¨ð¨  YOU WIN!  ððð  ð¨ð¨ð¨ð¨ð¨")
            print()
            print("     â THE SECRET NUMBER IS \(secretNumber) â")
            print()
            print("         ð CONGRATULATIONS! ð          ")
            print("__________________________________________")
            print("------------------------------------------")
            print("ð Do you want to play again?")
            playAgain()
        }
    } //end while
    
    print("ð¥ð¥ð¥ð¥ð¥  YOU LOSE! ððð  ð¥ð¥ð¥ð¥ð¥")
    print()
    print("      â THE SECRET NUMBER IS \(secretNumber) â")
    print("__________________________________________")
    print("------------------------------------------")
    print("ð Do you want to play again?")
    playAgain()
} //end func game
    
   

