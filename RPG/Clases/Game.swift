//
//  Game.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 9. Programmablauf programmieren

import Foundation

class Game {
    
    var helden: [Held] = [
        Barbar(name: "Barbar", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund),
        Kreuzritter(name: "Kreuzritter", hp: 100, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund),
        Magier(name: "Magier", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund),
        Hexendoktor(name: "Hexendoktor", hp: 100, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
    ]
    var gegner: [Gegner] = [
        Endgegner(name: "Urzael", hp: 150, angriffsPunkte: 30, etraSchild: 50, status: .gesund)
//        Scherger(name: "Fallen Angel", hp: 100, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
    ]
    

    
    var kampfBeutel: [Beutel] = [Beutel(trank: 5, paraHeiler: 2, feuerHeiler: 2, giftHeiler: 2, eisHeiler: 2)]
    

    

    
    func menu() {
        print("Willkommen bei DemonHunter".einruecken())
        print()
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
            break
        default:
            menu()
        }
    }
    
    func runden() {
        var rundenCounter: Int = 1
        repeat{
            print()
            print("Runde \(rundenCounter)".hashTags().einruecken())
            print()
            // kann in eine funktion ausgelagert werden
            for held in helden {
                print("\(held.name) hat noch \(held.hp) HP und einen Blockwert \(held.blockWert)")
            }
            print("---")
            // kann in eine funktion ausgelagert werden
            for enemy in gegner {
                print("\(enemy.name) hat noch \(enemy.hp) HP und \(enemy.etraSchild) Extra Schild")
            }
            print("---")
            
            for held in helden {
                if !gegner.isEmpty{
                    held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
                    gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
                    print("----")
                   // sleep(2)
                }
              
            }
            
            for enemy in gegner {
                if !helden.isEmpty {
                    enemy.aktionsMenue(ziele: helden, zuHeilen: [enemy])
                    helden.removeAll(where: {$0.hp <= 0})
                    print("----")
                   //sleep(4)
                }
                
            }
            if helden.isEmpty {
                print("Die Gegner haben Gewonnen")
                break
            } else if gegner.isEmpty {
                print("Die Helden haben Gewonnen")
                break
            }
           
            rundenCounter += 1
            let randomMasterCounter: Int = Int.random(in: 3...5)
            gegner[0].masterAttackCounter += randomMasterCounter
            
            // willst du beutel oder Attacken nutzen 
        }
        while gegner.contains(where: {$0.hp > 0}) || helden.contains(where: {$0.hp > 0})
    }
    
}
