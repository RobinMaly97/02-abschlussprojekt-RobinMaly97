//
//  Magier.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Magier: Held {
    
    // MARK: Frost Attacke
    func froststrahl(gegner: Gegner) {
        print("Der Magier \(self.name) setzt Froststrahl gegen \(gegner.name) ein")
        gegner.nimmSchaden(10 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
        }
        let random: Int = Int.random(in: 1...10)
        if random == 3 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden vereist")
            gegner.status = .vereist
           
        }
        
    }
    // MARK: Reguläre Attacke
    func explosion(gegner: Gegner) {
        print("Der Magier \(self.name) setzt Explosion gegen \(gegner.name) ein.")
        gegner.nimmSchaden(8.5 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
        }
    }
    // MARK: Brannt/Feuer Attacke
    func dreiKöpfigeHydra(gegner: Gegner) {
        print("Der Magier \(self.name) setzt die Drei Köpfige Hydra gegen \(gegner.name) ein gegner Hp: \(gegner.hp).")
        gegner.nimmSchaden(13.5 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
        }
        let random: Int = Int.random(in: 1...10)
        if random == 2 {
            print("Der Gegner \(gegner.name) brennt für 2 Runden.")
            gegner.status = .brennt
            
            
        }
        
    }
    // MARK: Heil Attacke
    func heilen(held: Held) {
        if held.name == self.name {
            print("Der Magier \(self.name) hat sich Selbst geheilt.")
            self.heilung(20)
        } else {
            print("Der Magier \(self.name) hat \(held.name) geheilt.")
            held.heilung(20)
        }
    }
    
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Magier greift \(ziel.name) HP: \(ziel.hp), Extra Schild \(ziel.etraSchild) an! Welche Attacke soll er ausführen?")
        print("[1] Frost Strahl, Stärke: 10")
        print("[2] Explosion, Stärke: 8.5")
        print("[3] Drei Köpfige Hydra, Stärke: 13.5")
        print("[4] Heilen, Stärke: 20")
        print("[5] Beutel öffnen")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Magier greift mit Frost Strahl an")
            froststrahl(gegner: ziel)
        case "2":
            print("Magier greift mit Explosion an")
            explosion(gegner: ziel)
        case "3":
            print("Magier greift mit Drei Köpfiger Hydra an")
            dreiKöpfigeHydra(gegner: ziel)
        case "4":
            print("Magier setz Heilen ein")
            heilen(held: self)
        case "5":
            print("Magier öffnet den Beutel")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    
    
    
    // MARK: Beutel
    func beutel() {
        print("Beutel")
        print("[1] Trank, Hp+: 10")
        print("[2] Para Heiler")
        print("[3] Feuer Heiler")
        print("[4] Gift Heiler")
        print("[5] EisHeiler")
        print("[6] Schwert Angr + 10")
        print("[7] Schild Vert + 10")
        print("[8] Eiserne Faust Angr + 10")
        print("[9] Geweite Axt  Angr + 10")
        print("[10] Feuer Rune Angr + 10")
        print("[11] Eis Rune Angr + 10")
        print("[12] Gift Rune Angr + 10")
        print("[13] Paralyse Rune Angr + 10")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("\(self.name) setz Trank ein und Heilt sich um 10 Hp")
         self.hp += 10
        case "2":
            print("\(self.name) setzt Para Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "3":
            print("\(self.name) setzt Feuer Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "4":
            print("\(self.name) setzt Gift Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "5":
            print("\(self.name) setzt Eis Heiler ein und ist nicht mehr Vereist")
            self.status = .gesund
        case "6":
            print("\(self.name) nimmt das Schwert. Sein nächster Angriff macht macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "7":
            print("\(self.name) blockiert den nächsten Angriff mit Schwert Block um 10 erhöht")
            self.blockWert += 10
        case "8":
            print("\(self.name) nimmt die Eiserne Faust. Sein nächster Angriff Macht 10 extra Schaden")
            self.angriffsPunkte += 10
        case "9":
            print("\(self.name) nimmt die Geweite Axt. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "10":
            print("\(self.name) nimmt die Feuer Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "11":
            print("\(self.name)  nimmt die Eis Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "12":
            print("\(self.name)  nimmt die Gift Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "13":
            print("\(self.name)  nimmt die Paralyse Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "14":
            print("\(self.name) geht zur Attacken Auswahl zurück")
            // geht leider nicht aktionsMenue(ziel: ziel, zuHeilen: Held:)
        default:
            beutel()
            
        }
            
    }

}
