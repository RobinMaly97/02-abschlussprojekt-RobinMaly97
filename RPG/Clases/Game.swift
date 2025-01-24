//
//  Game.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 9. Programmablauf programmieren

import Foundation

class Game{
    
    
    var highScores: [Highscore] = [
        Highscore(userName: "MetaMarv", runden: 8),
        Highscore(userName: "DrG4ming", runden: 10),
        Highscore(userName: "Pabloson", runden: 7),
        Highscore(userName: "Stahlrich", runden: 6)
        ]
    

    func highScoreListe() {
        
        let sortierteListe = highScores.sorted(by: {$0.runden < $1.runden})
        
        print("Highscores".hashTags().einruecken())
        for (index,highScore) in sortierteListe.enumerated() {
            print("Platz:\(index + 1)  |  UserName: \(highScore.userName)  |  Runden: \(highScore.runden)")
        }
    }

    
    
    var heldenAuswahl: [Held] = []
    var heldenCounter: Int = 0
    var schwierigkeitsGrad: schwierigkeitesGrad = .leicht
    
    var helden: [Held] = [
        Barbar(name: "Barbar", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund),
        Kreuzritter(name: "Kreuzritter", hp: 100.zweiStellenNachKomma, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund),
        Magier(name: "Magier", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund),
        Hexendoktor(name: "Hexendoktor", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
    ]
    var gegner: [Gegner] = [
        Endgegner(name: "Urzael", hp: 150.zweiStellenNachKomma, angriffsPunkte: 30, etraSchild: 50, status: .gesund)
//        Scherger(name: "Fallen Angel", hp: 100, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
    ]
    

    var scherger: Scherger? = nil
    
    var kampfBeutel: [Beutel] = [Beutel(trank: 5, paraHeiler: 2, feuerHeiler: 2, giftHeiler: 2, eisHeiler: 2)]
    

    func heldenAuswahlMenu() {
       print("[1] Barbar")
       print("[2] Kreuzritter")
       print("[3] Magier")
       print("[4] Hexendoktor")
       print("[5] Spiel Starten")
       print("[6] Zurück zum Hauptmenü ")
        
        let input: String = readLine()!
        
       switch input {
        case "1":
            print("Du Hast den Barbaren Gewählt")
          let barbar = Barbar(name: "Barbar", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund)
           heldenAuswahl.append(barbar)
           heldenAuswahlMenu()
        case "2":
            print("Du Hast den Kreuzritter Gewählt")
           let kreuzRitter = Kreuzritter(name: "Kreuzritter", hp: 100.zweiStellenNachKomma, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund)
           heldenAuswahl.append(kreuzRitter)
           heldenAuswahlMenu()
        case "3":
            print("Du Hast den Magier Gewählt")
           let magier = Magier(name: "Magier", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund)
           heldenAuswahl.append(magier)
           heldenAuswahlMenu()
        case "4":
           print("Du Hast den Hexendoktor Gewählt")
           let hexenDoktor = Hexendoktor(name: "Hexendoktor", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
           heldenAuswahl.append(hexenDoktor)
           heldenAuswahlMenu()
        case "5":
           print("Spiel Startet")
           rundenHeldenAuswahl()
        case "6":
            print("Zurück zum Hauptmenü")
           heldenAuswahl.removeAll()
           menu()
        default:
           heldenAuswahlMenu()
        }
    }

    func schwierigkeitsGradMenu() {
        print("Welchen Schwierigkeitsgrad möchtest du spielen?")
        print("[1] Leicht")
        print("[2] Mittel")
        print("[3] Schwer")
        
        let input: String = readLine()!
        switch input {
        case "1":
            print("Du hast Schwierigkeitsgrad Leicht gewählt")
            menu()
        case "2":
            print("Du hast Schwierigkeitsgrad Mittel gewählt")
            let scherger1 = Scherger(name: "Belial", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            schwierigkeitsGrad = .mittel
            gegner.append(scherger1)
            menu()
        case "3":
            print("Du hast Schwierigkeitsgrad Schwer gewählt")
            let scherger = Scherger(name: "Mathael", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            let scherger2 = Scherger(name: "Mephisto", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            schwierigkeitsGrad = .schwer
            gegner.append(scherger)
            gegner.append(scherger2)
            menu()
        default:
            schwierigkeitsGradMenu()
            
        }
       
        
        
    }
    
    func menu() {
        print("Willkommen bei DemonHunter".einruecken())
        print()
        print("Bitte wähle ein Zahl von 1 - 4")
        print("[1] Neues Spiel Starten")
        print("[2] Heldenauswahl")
        print("[3] Schwierigkeitsgrad")
        print("[4] Highscores")
        print("[5] Spiel Beenden")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Das Spiel Startet")
            runden()
        case "2":
            print("Mit welchen Helden Willst du Spielen ?")
            heldenAuswahlMenu()
        case "3":
            schwierigkeitsGradMenu()
        case "4":
            print("Alle HIGHSCORES")
            highScoreListe()
            menu()
        case "5":
            print("Spiel Beendet")
            break
        default:
            menu()
        }
    }
    
    
    func runden() {
        var rundenCounter: Int = 1
        print("Bitte gib deinen UserNamen ein")
        let userNameInput: String = readLine()!
        print()
        
        repeat{
            print()
            print("Runde \(rundenCounter)".hashTags().einruecken())
            print("Schwierigkeitsgrad: \(schwierigkeitsGrad.rawValue)")
            print()
            // kann in eine funktion ausgelagert werden
            for held in helden {
                print("\(held.name) hat noch \(held.hp)❤️ HP und einen Blockwert \(held.blockWert)🛡️. Status: \(held.status.rawValue)")
            }
            print("---")
            // kann in eine funktion ausgelagert werden
            for enemy in gegner {
                print("\(enemy.name) hat noch \(enemy.hp)❤️ HP und \(enemy.etraSchild)🛡️ Extra Schild. Status: \(enemy.status.rawValue)")
            }
            print("---")
            
            for held in helden {
                if !gegner.isEmpty{
                    held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
                    gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
                    print("----")
                   sleep(1)
                }
              
            }
            
            for enemy in gegner {
                if !helden.isEmpty {
                    if enemy is Endgegner {
                        let enemyEnd = enemy as! Endgegner
                        if enemy.hp <= enemyEnd.halbHp && !enemyEnd.schergerBeschworen{
                            scherger = enemyEnd.schergenBeschwören()
                            gegner.append(scherger!)
                        }
                    }
                    enemy.aktionsMenue(ziele: helden, zuHeilen: [enemy])
                    helden.removeAll(where: {$0.hp <= 0})
                    print("----")
                   sleep(1)
                }
                
            }
            if helden.isEmpty {
                print("😪😪😪Die Gegner haben Gewonnen😪😪😪")
                break
            } else if gegner.isEmpty {
                print("🎉🎉🎉Die Helden haben Gewonnen🎉🎉🎉")
                
                let highScore: Highscore = Highscore(userName: userNameInput, runden: rundenCounter)
                highScores.append(highScore)
                print("Der Highsore wurde abgespeichert \n \(userNameInput) hat nach \(rundenCounter) Uzrael und seinen Scherger besiegt.")
                break
            }
           
            rundenCounter += 1
            let randomMasterCounter: Int = Int.random(in: 3...5)
            gegner[0].masterAttackCounter += randomMasterCounter
            
            sleep(1)
            
        }
        while gegner.contains(where: {$0.hp > 0}) || helden.contains(where: {$0.hp > 0})
    }
    
    
    func rundenHeldenAuswahl() {
        var rundenCounter: Int = 1
        print("Bitte gib deinen UserNamen ein")
        let userNameInput: String = readLine()!
        print()
        
        repeat{
            print()
            print("Runde \(rundenCounter)".hashTags().einruecken())
            print()
            // kann in eine funktion ausgelagert werden
            for held in heldenAuswahl {
                print("\(held.name) hat noch \(held.hp)❤️ HP und einen Blockwert \(held.blockWert)🛡️. Status: \(held.status.rawValue)")
            }
            print("---")
            // kann in eine funktion ausgelagert werden
            for enemy in gegner {
                print("\(enemy.name) hat noch \(enemy.hp)❤️ HP und \(enemy.etraSchild)🛡️ Extra Schild. Status: \(enemy.status.rawValue)")
            }
            print("---")
            
            for held in heldenAuswahl {
                if !gegner.isEmpty{
                    held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
                    gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
                    print("----")
                   sleep(1)
                }
              
            }
            
            for enemy in gegner {
                if !heldenAuswahl.isEmpty {
                    if enemy is Endgegner {
                        let enemyEnd = enemy as! Endgegner
                        if enemy.hp <= enemyEnd.halbHp && !enemyEnd.schergerBeschworen{
                            scherger = enemyEnd.schergenBeschwören()
                            gegner.append(scherger!)
                        }
                    }
                    enemy.aktionsMenue(ziele: heldenAuswahl, zuHeilen: [enemy])
                    helden.removeAll(where: {$0.hp <= 0})
                    print("----")
                   sleep(1)
                }
                
            }
            if heldenAuswahl.isEmpty {
                print("😪😪😪Die Gegner haben Gewonnen😪😪😪")
                break
            } else if gegner.isEmpty {
                print("🎉🎉🎉Die Helden haben Gewonnen🎉🎉🎉")
                
                let highScore: Highscore = Highscore(userName: userNameInput, runden: rundenCounter)
                highScores.append(highScore)
                print("Der Highsore wurde abgespeichert \n \(userNameInput) hat nach \(rundenCounter) Uzrael und seinen Scherger besiegt.")
                break
            }
           
            rundenCounter += 1
            let randomMasterCounter: Int = Int.random(in: 3...5)
            gegner[0].masterAttackCounter += randomMasterCounter
            
            sleep(1)
            
        }
        while gegner.contains(where: {$0.hp > 0}) || heldenAuswahl.contains(where: {$0.hp > 0})
    }
}
