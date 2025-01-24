//
//  Magier.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Magier: Held {
    
    var statusCounter: Int = 0
    
    // MARK: Frost Attacke
    func froststrahl(gegner: Gegner) {
        print("\(self.name) setzt ❄️❄️❄️Froststrahl❄️❄️❄️ gegen \(gegner.name) mit einer HP von \(gegner.hp) ❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(10 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        let random: Int = Int.random(in: 1...2)
        if random == 2 {
            print("\(gegner.name) wurde für 2 Runden vereist ❄️❄️.")
            gegner.status = .vereist
           
        }
        
    }
    // MARK: Reguläre Attacke
    func explosion(gegner: Gegner) {
        print("\(self.name) setzt 💥💥💥Explosion💥💥💥 gegen \(gegner.name) mit einer HP von \(gegner.hp) ❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(8.5 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
    }
    // MARK: Brannt/Feuer Attacke
    func dreiKöpfigeHydra(gegner: Gegner) {
        print("\(self.name) setzt die 🐉🐉🐉Drei Köpfige Hydra🐉🐉🐉 gegen \(gegner.name) mit einer HP von \(gegner.hp) ❤️ und extra Schild: \(max(gegner.etraSchild,0)) ein.")
        gegner.nimmSchaden(13.5 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        let random: Int = Int.random(in: 1...5)
        if random == 2 {
            print("\(gegner.name) brennt 🔥🔥 für 2 Runden.")
            gegner.status = .brennt
            
            
        }
        
    }
    // MARK: Heil Attacke
    func heilen(held: Held) {
        if held.name == self.name {
            print("\(self.name) hat sich Selbst ❤️❤️❤️geheilt❤️❤️❤️ mit einer HP von \(self.hp) ❤️.")
            self.heilung(20)
        } else {
            print("\(self.name) hat \(held.name) ❤️❤️❤️geheilt❤️❤️❤️ mit einer HP von \(held.hp) ❤️.")
            held.heilung(20)
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
            print("[1] Frost Strahl, Stärke: 10 ❄️❄️❄️")
            print("[2] Explosion, Stärke: 8.5 💥💥💥")
            print("[3] Drei Köpfige Hydra, Stärke: 13.5 🐉🐉🐉")
            print("[4] Heilen, Stärke: 20 ❤️❤️❤️")
            print("[5] Beutel öffnen 🎒🎒🎒")
            
            let input: String = readLine()!
            
            switch input {
            case "1":
                froststrahl(gegner: ziel)
            case "2":
                explosion(gegner: ziel)
            case "3":
                dreiKöpfigeHydra(gegner: ziel)
            case "4":
                heilen(held: self)
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
        print("[4] Feuer Rune Angr + 10 🔥🀄️  Anzahl: \(max(beutel.items[0].anzahlVerwendung,0))")
        print("[5] Eis Rune Angr + 10 ❄️🀄️ Anzahl: \(max(beutel.items[1].anzahlVerwendung,0))")
        print("[6] Gift Rune Angr + 10 ☠️🀄️ Anzahl: \(max(beutel.items[2].anzahlVerwendung,0))")
        print("[7] Paralyse Rune Angr + 10 ⚡️🀄️ Anzahl: \(max(beutel.items[3].anzahlVerwendung,0))")
        print("[8] Zurück zur Attacken Auswahl ⚔️")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            if beutel.trank > 0 {
                print("\(self.name) setz Trank ❤️❤️ ein und Heilt sich um 10 Hp ❤️")
               beutel.trank -= 1
             self.hp += 10
            } else {
                print("Du hast alle Tränke ❤️❤️ aufgebraucht.")
                print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                beutel(ziel: ziel, zuHeilen: zuHeilen)
            }
        case "2":
            if beutel.feuerHeiler > 0 {
                print("\(self.name) setzt Feuer Heiler 🔥❤️ ein und ist wieder Gesund ❤️")
                self.status = .gesund
                beutel.feuerHeiler -= 1
            } else {
                print("Du hast alle Feuer Heiler 🔥❤️ aufgebraucht.")
                print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                beutel(ziel: ziel, zuHeilen: zuHeilen)
            }
        case "3":
            if beutel.giftHeiler > 0 {
                print("\(self.name) setzt Gift Heiler ❤️☠️ ein und ist wieder Gesund ❤️")
                self.status = .gesund
                beutel.giftHeiler -= 1
            } else {
                print("Du hast alle Gift Heiler ❤️☠️ aufgebraucht.")
                print("Bitte wähle ein anderen Gegenstand aus dem Beutel")
                beutel(ziel: ziel, zuHeilen: zuHeilen)
            }
        case "4":
            if beutel.items[0].anzahlVerwendung > 0 {
                print("\(self.name) nimmt die Feuer Rune 🔥🀄️. Sein nächster Angriff Macht 10 extra Schaden")
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
                print("\(self.name) nimmt die Eis Rune ❄️🀄️. Sein nächster Angriff Macht 10 extra Schaden")
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
                print("\(self.name) nimmt die Gift Rune ☠️🀄️. Sein nächster Angriff Macht 10 extra Schaden")
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
                print("\(self.name) nimmt die Paralyse Rune ⚡️🀄️. Sein nächster Angriff Macht 10 extra Schaden")
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
