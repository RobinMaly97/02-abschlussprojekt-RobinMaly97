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
        gegner.hp = gegner.hp - 10
    }
    // MARK: Reguläre Attacke
    func geisterSpeerFeuer(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Geister Speerfeuer gegen \(gegner.name) ein.")
        gegner.hp = gegner.hp - 11.5
    }
    // MARK: Paralyse Attacke
    func paralyseBombe(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Paralyse Bombe gegen \(gegner.name) ein.")
        gegner.hp = gegner.hp - 8.5
        let random: Int = Int.random(in: 1...10)
        if random == 5 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden paralysiert")
            // gegner.status = gegner.status.paralysiert (wird noch eingebunden wenn ich bei den Enums bin.)
        }
    }
    // MARK: Gift Attacke
    func giftPfeil(gegner: Gegner) {
        print("Der Hexendoktor \(self.name) setzt Gift Pfeil gegen \(gegner.name) ein.")
        gegner.hp = gegner.hp - 10.5
        let random: Int = Int.random(in: 1...10)
        if random == 7 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden vergiftet")
            // gegner.status = gegner.status.vergiftet (wird noch eingebunden wenn ich bei den Enums bin.)
        }
    }
    // MARK: Beutel
    func beutel() {
        print("Beutel")
    }
}
