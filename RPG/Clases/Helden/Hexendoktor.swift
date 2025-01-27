//
//  Hexendoktor.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Hexendoktor: Held {
    
    var statusCounter: Int = 0
    
    // MARK: Reguläre Attacke
    func seelenErnte(gegner: Gegner) {
        print("\(self.name) setzt \(blinken)👻👻👻Seelen Ernte👻👻👻\(reset) gegen \(gegner.name) mit einer HP von \(gegner.hp)❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(10 + (item?.schadensWert ?? 0))
        item?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        
    }
    // MARK: Reguläre Attacke
    func geisterSpeerFeuer(gegner: Gegner) {
        print("\(self.name) setzt \(blinken)👻🔥🔥Geister Speerfeuer👻🔥🔥\(reset) gegen \(gegner.name) mit einer HP von \(gegner.hp)❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(11.5 + (item?.schadensWert ?? 0))
        item?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        
    }
    // MARK: Paralyse Attacke
    func paralyseBombe(gegner: Gegner) {
        print("\(self.name) setzt \(blinken)⚡️💣💣Paralyse Bombe⚡️💣💣\(reset) gegen \(gegner.name) mit einer HP von \(gegner.hp)❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(8.5 + (item?.schadensWert ?? 0))
        item?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        let random: Int = Int.random(in: 1...5)
        if random == 5 {
            print("\(gegner.name) wurde für 2 Runden paralysiert ⚡️⚡️ und kann nicht angreifen.")
            gegner.status = .paralysiert
            
        }
    }
    // MARK: Gift Attacke
    func giftPfeil(gegner: Gegner) {
        print("\(self.name) setzt ☠️🏹🏹Gift Pfeil☠️🏹🏹\(reset) gegen \(gegner.name) mit einer HP von \(gegner.hp)❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(10 + (item?.schadensWert ?? 0))
        item?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        print("\(gegner.name) verliert 10.5 HP \(gegner.hp).")
        let random: Int = Int.random(in: 1...5)
        if random == 2 {
            print("\(gegner.name) wurde für 2 Runden vergiftet ☠️☠️ und verliert jede Runde 10% seiner HP ❤️.")
            gegner.status = .vergiftet
        }
    }
    
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        if statusCounter < 2 && status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            statusCounter += 1
        } else {
            if status == .vergiftet || status == .brennt {
                print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ❤️")
                print("\(self.name) wurden \(self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)❤️ Hp abgezogen. Rest Hp \(self.hp.zweiStellenNachKomma - self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)❤️")
                self.hp = self.hp.zweiStellenNachKomma - (self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)
                
                
                statusCounter += 1
                
            }
            print("\(self.name) greift \(ziel.name) HP: \(ziel.hp)❤️, Extra Schild \(max(ziel.etraSchild,0)) 🛡️ an! Welche Attacke soll er ausführen?")            
            print("[1] Seelen Ernte, Stärke: 10 👻👻👻")
            print("[2] Geister Speerfeuer, Stärke: 11.5 👻🔥🔥")
            print("[3] Paralyse Bombe, Stärke: 8.5 ⚡️💣💣")
            print("[4] Gift Pfeil, Stärke: 10.5 ☠️🏹🏹")
            print("[5] Beutel öffnen 🎒🎒🎒")
            
            let input: String = readLine()!
            
            switch input {
            case "1":
                seelenErnte(gegner: ziel)
            case "2":
                geisterSpeerFeuer(gegner: ziel)
            case "3":
                paralyseBombe(gegner: ziel)
            case "4":
                giftPfeil(gegner: ziel)
            case "5":
                print("\(self.name) öffnet den Beutel 🎒🎒🎒")
                beutel(ziel: ziel, zuHeilen: zuHeilen)
            default:
                aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                
            }
        }
        
    }
        
        
        // MARK: Beutel
        func beutel(ziel: Gegner, zuHeilen: Held) {
            print("Beutel")
            print("[1] Trank, Hp + 10 ❤️❤️ Anzahl: \(max(beutel.trank,0))")
            print("[2] Feuer Heiler 🔥❤️ Anzahl: \(max(beutel.feuerHeiler,0))")
            print("[3] Gift Heiler ☠️❤️ Anzahl: \(max(beutel.giftHeiler,0))")
            print("[4] Feuer Rune Angr + 20 🔥🀄️  Anzahl: \(max(beutel.items[0].anzahlVerwendung,0))")
            print("[5] Eis Rune Angr + 20 ❄️🀄️ Anzahl: \(max(beutel.items[1].anzahlVerwendung,0))")
            print("[6] Gift Rune Angr + 20 ☠️🀄️ Anzahl: \(max(beutel.items[2].anzahlVerwendung,0))")
            print("[7] Paralyse Rune Angr + 20 ⚡️🀄️ Anzahl: \(max(beutel.items[3].anzahlVerwendung,0))")
            print("[8] Zurück zur Attacken Auswahl ⚔️")
            
            let input: String = readLine()!
            
            switch input {
            case "1":
                if beutel.trank > 0 {
                    print("\(self.name) setz \(blinken)Trank ❤️❤️\(reset) ein und Heilt sich um 10 Hp ❤️")
                   beutel.trank -= 1
                 self.hp += 10
                } else {
                    print("Du hast alle Tränke ❤️❤️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "2":
                if beutel.feuerHeiler > 0 {
                    print("\(self.name) setzt \(blinken)Feuer Heiler 🔥❤️\(reset) ein und ist wieder Gesund ❤️")
                    self.status = .gesund
                    beutel.feuerHeiler -= 1
                } else {
                    print("Du hast alle Feuer Heiler 🔥❤️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "3":
                if beutel.giftHeiler > 0 {
                    print("\(self.name) setzt \(blinken)Gift Heiler ❤️☠️\(reset) ein und ist wieder Gesund ❤️")
                    self.status = .gesund
                    beutel.giftHeiler -= 1
                } else {
                    print("Du hast alle Gift Heiler ❤️☠️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "4":
                if beutel.items[0].anzahlVerwendung > 0 {
                    print("\(self.name) nimmt die \(blinken)Feuer Rune 🔥🀄️\(reset). Sein nächster Angriff Macht 10 extra Schaden")
                    self.item = beutel.items[0]
                    self.item?.schadensWert += 10
                    beutel.items[0].anzahlVerwendung -= 1
                    aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                } else {
                    print("Du hast alle Feuer Runen 🔥🀄️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "5":
                if beutel.items[1].anzahlVerwendung > 0 {
                    print("\(self.name) nimmt die \(blinken)Eis Rune ❄️🀄️\(reset). Sein nächster Angriff Macht 10 extra Schaden")
                    self.item = beutel.items[1]
                    self.item?.schadensWert += 10
                    beutel.items[1].anzahlVerwendung -= 1
                    aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                } else {
                    print("Du hast alle Eis Runen ❄️🀄️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "6":
                if beutel.items[2].anzahlVerwendung > 0 {
                    print("\(self.name) nimmt die \(blinken)Gift Rune ☠️🀄️\(reset). Sein nächster Angriff Macht 10 extra Schaden")
                    self.item = beutel.items[2]
                    self.item?.schadensWert += 10
                    beutel.items[2].anzahlVerwendung -= 1
                    aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                } else {
                    print("Du hast alle Gift Runen ☠️🀄️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "7":
                if beutel.items[3].anzahlVerwendung > 0 {
                    print("\(self.name) nimmt die \(blinken)Paralyse Rune ⚡️🀄️\(reset). Sein nächster Angriff Macht 10 extra Schaden")
                    self.item = beutel.items[3]
                    self.item?.schadensWert += 10
                    beutel.items[3].anzahlVerwendung -= 1
                    aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                } else {
                    print("Du hast alle Paralyse Runen ⚡️🀄️ aufgebraucht.")
                    print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                    beutel(ziel: ziel, zuHeilen: zuHeilen)
                }
            case "8":
                print("\(self.name) geht zur Attacken Auswahl zurück ⚔️")
                aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            default:
                beutel(ziel: ziel, zuHeilen: zuHeilen)
                
            }
            
        }
        
    
}
