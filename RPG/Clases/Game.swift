//
//  Game.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 9. Programmablauf programmieren

import Foundation
import AVFoundation
class Game{
    
    
    var highScores: [Highscore] = [
        Highscore(userName: "MetaMarv", runden: 8),
        Highscore(userName: "DrG4ming", runden: 10),
        Highscore(userName: "Pabloson", runden: 7),
        Highscore(userName: "Stahlrich", runden: 6)
    ]
    
    
    func highScoreListe() {
        
        let sortierteListe = highScores.sorted(by: {$0.runden < $1.runden})
        
        print("""
             \(yellow)\(blinken)\(bold)

██╗  ██╗██╗ ██████╗ ██╗  ██╗███████╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗
██║  ██║██║██╔════╝ ██║  ██║██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
███████║██║██║  ███╗███████║███████╗██║     ██║   ██║██████╔╝█████╗  ███████╗
██╔══██║██║██║   ██║██╔══██║╚════██║██║     ██║   ██║██╔══██╗██╔══╝  ╚════██║
██║  ██║██║╚██████╔╝██║  ██║███████║╚██████╗╚██████╔╝██║  ██║███████╗███████║
╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
\(reset)
""".hashTags().einruecken())
        for (index,highScore) in sortierteListe.enumerated() {
            print("Platz:\(index + 1)  |  UserName: \(highScore.userName)  |  Runden: \(highScore.runden)")
        }
    }
    
    
    
    var heldenAuswahl: [Held] = []
    var heldenCounter: Int = 0
    var schwierigkeitsGrad: schwierigkeitesGrad = .leicht
    var helden: [Held] = [
        Barbar(name: "\(green)Barbar\(reset)", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund),
        Kreuzritter(name: "\(green)Kreuzritter\(reset)", hp: 100.zweiStellenNachKomma, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund),
        Magier(name: "\(green)Magier\(reset)", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund),
        Hexendoktor(name: "\(green)Hexendoktor\(reset)", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
    ]
    var gegner: [Gegner] = [
        Endgegner(name: "\(red)Urzael\(reset)", hp: 100.zweiStellenNachKomma, angriffsPunkte: 30, etraSchild: 30, status: .gesund)
        
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
            print("Weitere Helden Auswählen oder Spiel Starten.")
            let barbar = Barbar(name: "Barbar", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 20, status: .gesund)
            heldenAuswahl.append(barbar)
            heldenAuswahlMenu()
        case "2":
            print("Du Hast den Kreuzritter Gewählt")
            print("Weitere Helden Auswählen oder Spiel Starten.")
            let kreuzRitter = Kreuzritter(name: "Kreuzritter", hp: 100.zweiStellenNachKomma, angriffsPunkte: 15, verteidigungsPunkte: 20, status: .gesund)
            heldenAuswahl.append(kreuzRitter)
            heldenAuswahlMenu()
        case "3":
            print("Du Hast den Magier Gewählt")
            print("Weitere Helden Auswählen oder Spiel Starten.")
            let magier = Magier(name: "Magier", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 15, status: .gesund)
            heldenAuswahl.append(magier)
            heldenAuswahlMenu()
        case "4":
            print("Du Hast den Hexendoktor Gewählt")
            print("Weiter Helden Auswählen oder Spiel Starten.")
            let hexenDoktor = Hexendoktor(name: "Hexendoktor", hp: 100.zweiStellenNachKomma, angriffsPunkte: 20, verteidigungsPunkte: 10, status: .gesund)
            heldenAuswahl.append(hexenDoktor)
            heldenAuswahlMenu()
        case "5":
            if !heldenAuswahl.isEmpty {
                print("Spiel Startet")
                audioPlayer?.stop()
                rundenHeldenAuswahl()
            } else {
                print("Du hast noch kein/e Held/en ausgewählt mit denen du Kämpfen möchtest.")
                print("Bitte wähle ein oder mehrer Helden aus.")
                heldenAuswahlMenu()
            }
           
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
            let scherger1 = Scherger(name: "\(magenta)Belial\(reset)", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            schwierigkeitsGrad = .mittel
            gegner.append(scherger1)
            menu()
        case "3":
            print("Du hast Schwierigkeitsgrad Schwer gewählt")
            let scherger = Scherger(name: "\(magenta)Mathael\(reset)", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            let scherger2 = Scherger(name: "\(magenta)Mephisto\(reset)", hp: 80, angriffsPunkte: 20, etraSchild: 0, status: .gesund)
            schwierigkeitsGrad = .schwer
            gegner.append(scherger)
            gegner.append(scherger2)
            menu()
        default:
            schwierigkeitsGradMenu()
            
        }
        
        
        
    }
    
    func menu() {
        print("""
              \(blue)\(bold)
              ████████▄     ▄████████   ▄▄▄▄███▄▄▄▄    ▄██████▄  ███▄▄▄▄      ▄█    █▄    ███    █▄  ███▄▄▄▄       ███        ▄████████    ▄████████
              ███   ▀███   ███    ███ ▄██▀▀▀███▀▀▀██▄ ███    ███ ███▀▀▀██▄   ███    ███   ███    ███ ███▀▀▀██▄ ▀█████████▄   ███    ███   ███    ███
              ███    ███   ███    █▀  ███   ███   ███ ███    ███ ███   ███   ███    ███   ███    ███ ███   ███    ▀███▀▀██   ███    █▀    ███    ███
              ███    ███  ▄███▄▄▄     ███   ███   ███ ███    ███ ███   ███  ▄███▄▄▄▄███▄▄ ███    ███ ███   ███     ███   ▀  ▄███▄▄▄      ▄███▄▄▄▄██▀
              ███    ███ ▀▀███▀▀▀     ███   ███   ███ ███    ███ ███   ███ ▀▀███▀▀▀▀███▀  ███    ███ ███   ███     ███     ▀▀███▀▀▀     ▀▀███▀▀▀▀▀  
              ███    ███   ███    █▄  ███   ███   ███ ███    ███ ███   ███   ███    ███   ███    ███ ███   ███     ███       ███    █▄  ▀███████████
              ███   ▄███   ███    ███ ███   ███   ███ ███    ███ ███   ███   ███    ███   ███    ███ ███   ███     ███       ███    ███   ███    ███
              ████████▀    ██████████  ▀█   ███   █▀   ▀██████▀   ▀█   █▀    ███    █▀    ████████▀   ▀█   █▀     ▄████▀     ██████████   ███    ███
                                                                                                                                          ███    ███
              \(reset)
              """.einruecken())
        
        print()
        print("Bitte wähle ein Zahl von 1 - 4")
        print("[1] Neues Spiel Starten")
        print("[2] Heldenauswahl")
        print("[3] Schwierigkeitsgrad")
        print("[4] Highscores")
        print("[5] Spiel Beenden")
        playSound(path: introSound)
        
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("\(blue)\(bold)Das Spiel Startet\(reset)".einruecken())
            audioPlayer?.stop()
            runden()
        case "2":
            print("Mit welchen Helden Willst du Spielen ?")
            heldenAuswahlMenu()
        case "3":
            schwierigkeitsGradMenu()
        case "4":
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
        backGroundSound(path: hinterGrundSound)
        var rundenCounter: Int = 1
        print()
        print("\(cyan)\(bold)Bitte gib deinen UserNamen ein\(reset)")
        let userNameInput: String = readLine()!
        print()
        
        repeat{
            print()
            print("\(blue) \(bold) Runde \(rundenCounter) \(reset)".hashTags().einruecken())
            print("Schwierigkeitsgrad: \(schwierigkeitsGrad.rawValue)")
            print()
          
            print("\(green) \(bold)Heldenliste \(reset)".hashTags())
            for (index,held) in helden.enumerated() {
                print("Held: \(index+1)")
                print("\(held.name) hat noch \(max(held.hp.zweiStellenNachKomma,0))❤️ HP und einen Blockwert \(max(held.blockWert,0))🛡️. Status: \(held.status.rawValue)")
                Thread.sleep(forTimeInterval: 0.5)

            }
            print("---")
            // kann in eine funktion ausgelagert werden
            print("\(red) \(bold)Gegnerliste \(reset)".hashTags())
            for (index,enemy) in gegner.enumerated() {
                print("Gegner: \(index+1)")
                print("\(enemy.name) hat noch \(max(enemy.hp.zweiStellenNachKomma,0))❤️ HP und \(max(enemy.etraSchild,0))🛡️ Extra Schild. Status: \(enemy.status.rawValue)")
                Thread.sleep(forTimeInterval: 0.5)

            }
            print("---")
            print("\(blue) \(bold)Helden Liste\(reset)".hashTags())
            for held in helden {
                if !gegner.isEmpty{
                    held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
                    gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
                    print("----")
                    Thread.sleep(forTimeInterval: 0.5)

                }
              
            }
            
            sleep(1)
            
            print("\(red) \(bold)Gegner Liste\(reset)".hashTags())
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
                    Thread.sleep(forTimeInterval: 0.5)

                }
                
            }
            if helden.isEmpty {
                print("\(bold)\(blinken)\(red)😪😪😪Die Gegner haben Gewonnen😪😪😪\(reset)")
                playSound(path: verlorenSound)
                Thread.sleep(forTimeInterval: 1.0)
                audioPlayer?.stop()
                break
            } else if gegner.isEmpty {
                print("\(bold)\(blinken)\(green)🎉🎉🎉Die Helden haben Gewonnen🎉🎉🎉\(reset)")
                playSound(path: winSound)
                Thread.sleep(forTimeInterval: 1.2)
                audioPlayer?.stop()
                let highScore: Highscore = Highscore(userName: userNameInput, runden: rundenCounter)
                highScores.append(highScore)
                print("Der Highsore wurde abgespeichert \n \(userNameInput) hat nach \(rundenCounter) Runden Uzrael und seinen Scherger besiegt.")
                break
            }
           
            rundenCounter += 1
            let randomMasterCounter: Int = Int.random(in: 3...5)
            gegner[0].masterAttackCounter += randomMasterCounter
            
            Thread.sleep(forTimeInterval: 0.5)

            
        }
        while gegner.contains(where: {$0.hp > 0}) || helden.contains(where: {$0.hp > 0})
    }
    
    
    func rundenHeldenAuswahl() {
        backGroundSound(path: hinterGrundSound)
        var rundenCounter: Int = 1
        print()
        print("\(cyan)\(bold)Bitte gib deinen UserNamen ein\(reset)")
        let userNameInput: String = readLine()!
        print()
        
        repeat{
            print()
            print("\(blue) \(bold)Runde \(rundenCounter)\(reset)".hashTags().einruecken())
            print()
            print()
            print("\(green) \(bold)Heldenliste \(reset)".hashTags())
            for (index,held) in heldenAuswahl.enumerated() {
                print("Held: \(index+1)")
                print("\(held.name) hat noch \(max(held.hp.zweiStellenNachKomma,0))❤️ HP und einen Blockwert  \(max(held.blockWert,0))🛡️. Status: \(held.status.rawValue)")
                Thread.sleep(forTimeInterval: 0.5)
               
            }
            print("---")
            // kann in eine funktion ausgelagert werden
            print("\(red) \(bold)Gegnerliste \(reset)".hashTags())
            for (index,enemy) in gegner.enumerated() {
                print("Gegner: \(index+1)")
                print("\(enemy.name) hat noch \(max(enemy.hp.zweiStellenNachKomma,0))❤️ HP und  \(max(enemy.etraSchild,0))🛡️ Extra Schild. Status: \(enemy.status.rawValue)")
                Thread.sleep(forTimeInterval: 0.5)
            }
            print("---")
            print("\(blue) \(bold)Helden Liste\(reset)".hashTags())
            for held in heldenAuswahl {
                if !gegner.isEmpty{
                    held.aktionsMenue(ziel: gegner.randomElement()!, zuHeilen: held)
                    gegner.removeAll(where: {$0.hp <= 0}) // in funktion schreiben
                    print("----")
                    Thread.sleep(forTimeInterval: 0.5)

                }
              
            }
            print("\(red) \(bold)Gegner Liste\(reset)".hashTags())
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
                    heldenAuswahl.removeAll(where: {$0.hp <= 0})
                    print("----")
                    Thread.sleep(forTimeInterval: 0.5)

                }
                
            }
            if heldenAuswahl.isEmpty {
                print("\(red)\(blinken)\(bold)😪😪😪Die Gegner haben Gewonnen😪😪😪 \(reset)")
                playSound(path: verlorenSound)
                Thread.sleep(forTimeInterval: 1.0)
                audioPlayer?.stop()
                break
            } else if gegner.isEmpty {
                print("\(green)\(blinken)\(bold)🎉🎉🎉Die Helden haben Gewonnen🎉🎉🎉\(reset)")
                playSound(path: winSound)
                Thread.sleep(forTimeInterval: 1.2)
                audioPlayer?.stop()
                let highScore: Highscore = Highscore(userName: userNameInput, runden: rundenCounter)
                highScores.append(highScore)
                print("Der Highsore wurde abgespeichert \n \(userNameInput) hat nach \(rundenCounter) Uzrael und seinen Scherger besiegt.")
                break
            }
           
            rundenCounter += 1
            let randomMasterCounter: Int = Int.random(in: 3...5)
            gegner[0].masterAttackCounter += randomMasterCounter
            
            Thread.sleep(forTimeInterval: 0.5)

            
        }
        while gegner.contains(where: {$0.hp > 0}) || heldenAuswahl.contains(where: {$0.hp > 0})
    }
    
    
    
    func playSound(path: String) {
        // erstellt ein URL-Objekt aus dem dateipfad:
        let url = URL(fileURLWithPath: path)
        // versuch, den sound abzuspielen
        do {
        // audioplayer mit dem angegebenen URL-Objekt erstellen:
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            // startet die wiedergabe des sounds
            audioPlayer?.play()
        }
        // falls ein fehler auftritt, wird dieser im catch-block abgefangen und eine meldung ausgegeben
        catch {
            print("Fehler beim Abspielen des Sounds: \(error) --\(error.localizedDescription)")
        }
    }
    
    
    var backGroundAudioPlayer: AVAudioPlayer?
    
    func backGroundSound(path: String){
        
        let url = URL(fileURLWithPath: path)
        
        do {
            backGroundAudioPlayer = try AVAudioPlayer(contentsOf: url)
            
            backGroundAudioPlayer?.numberOfLoops = -1
            backGroundAudioPlayer?.play()
            backGroundAudioPlayer?.volume = 0.8
        } catch {
            print("Fehler beim Abspielen des Sounds: \(error) --\(error.localizedDescription)")
        }
    }

}

