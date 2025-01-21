//
//  Game.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 9. Programmablauf programmieren



class Game {
    
    var helden: [Held] = [
        Held(name: "Barbar", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund),
        Held(name: "Kreuzritter", hp: 100, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund),
        Held(name: "Magier", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund),
        Held(name: "Hexendoktor", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
    ]
    var gegner: [Gegner] = [
        Gegner(name: "Urzael", hp: 150, angriffsPunkte: 30, etraSchild: 50, status: .gesund),
        Gegner(name: "Scherger", hp: 100, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
    ]
    

    
    var kampfBeutel: [Beutel] = [Beutel(trank: 5, paraHeiler: 2, feuerHeiler: 2, giftHeiler: 2, eisHeiler: 2)]
    

    

    
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
            runden()
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
    
    func runden() {
        
        // hier kommt eine repeat while scheife rein
        var rundenCounter: Int = 1
        print("Runde \(rundenCounter)".hashTags())
        // kann in eine funktion ausgelagert werden
        for held in helden {
            print("\(held.name) hat noch \(held.hp) HP")
        }
        print("---")
        // kann in eine funktion ausgelagert werden
        for enemy in gegner {
            print("\(enemy.name) hat noch \(enemy.hp) HP")
        }
        print("---")
        
        for held in helden {
            held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
            gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
        }
        
        for enemy in gegner {
            enemy.aktionsMenue(ziel: helden.randomElement()!, zuHeilen: enemy)
            helden.removeAll(where: {$0.hp <= 0})
        }
       
        rundenCounter = rundenCounter + 1
    }
    
}
