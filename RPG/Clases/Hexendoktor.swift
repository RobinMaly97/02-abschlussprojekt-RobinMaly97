//
//  Hexendoktor.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Hexendoktor: Held {
    
    // MARK: Reguläre Attacke
    func seelenErnte(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Seelen Ernte gegen \(gegner.name) ein.")
        gegner.nimmSchaden(10)
        print("Der Gegner \(gegner.name) verliert 10 HP, Rest HP \(gegner.hp).")
    }
    // MARK: Reguläre Attacke
    func geisterSpeerFeuer(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Geister Speerfeuer gegen \(gegner.name) ein.")
        gegner.nimmSchaden(11.5)
        print("Der Gegner \(gegner.name) verliert 11.5 HP \(gegner.hp).")
    }
    // MARK: Paralyse Attacke
    func paralyseBombe(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Paralyse Bombe gegen \(gegner.name) ein.")
        gegner.nimmSchaden(8.5)
        print("Der Gegner \(gegner.name) verliert 8.5 HP \(gegner.hp).")
        let random: Int = Int.random(in: 1...10)
        if random == 5 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden paralysiert und kann nicht angreifen.")
            gegner.status = .paralysiert
            
        }
    }
    // MARK: Gift Attacke
    func giftPfeil(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Gift Pfeil gegen \(gegner.name) ein.")
        gegner.nimmSchaden(10.5)
        print("Der Gegner \(gegner.name) verliert 10.5 HP \(gegner.hp).")
        let random: Int = Int.random(in: 1...10)
        if random == 7 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden vergiftet und verliert jede Runde 10% seiner HP.")
            gegner.status = .vergiftet
        }
    }
    
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Hexendoktor greift an! Welche Attacke soll er ausführen?")
        print("[1] Seelen Ernte, Stärke: 10")
        print("[2] Geister Speerfeuer, Stärke: 11.5")
        print("[3] Paralyse Bombe, Stärke: 8.5")
        print("[4] Gift Pfeil, Stärke: 10.5")
        print("[5] Beutel öffnen")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Hexendoktor greift mit Seelen Ernte an")
            seelenErnte(gegner: ziel)
        case "2":
            print("Hexendoktor greift mit Geister Speerfeuer an")
            geisterSpeerFeuer(gegner: ziel)
        case "3":
            print("Hexendoktor greif mit Paralyse Bombe an")
            paralyseBombe(gegner: ziel)
        case "4":
            print("Hexendoktor greift mit Gift Pfeil an")
            giftPfeil(gegner: ziel)
        case "5":
            print("barbar öffnet den Beutel")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    
    
    // MARK: Beutel
    func beutel() {
        print("Beutel")
    }
}
