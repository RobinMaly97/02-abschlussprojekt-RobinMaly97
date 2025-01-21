//
//  Game.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 9. Programmablauf programmieren



class Game {
    func menu() {
        print("Bitte wähle ein Zahl von 1 - 4")
        print("[1] Neues Spiel Starten")
        print("[2] Helden Auswahl")
        print("[3] Highscores")
        print("[4] Spiel Beenden")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Das Spiel Startet")
        case "2":
            print("Bitte Wähle mindestens 2 Helden aus.")
        case "3":
            print("Alle HIGHSCORES")
        case "4":
            print("Spiel Beendet")
        default:
            menu()
        }
    }
}
