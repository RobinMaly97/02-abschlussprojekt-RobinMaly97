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
    }
}
