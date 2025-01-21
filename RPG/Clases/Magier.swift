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
        gegner.hp = gegner.hp - 10
        let random: Int = Int.random(in: 1...10)
        if random == 3 {
            print("Der Gegner \(gegner.name) wurde für 2 Runden vereist")
            gegner.status = .vereist
           
        }
        
    }
    // MARK: Reguläre Attacke
    func explosion(gegner: Gegner) {
        print("Der Magier \(self.name) setzt Explosion gegen \(gegner.name) ein.")
        gegner.hp = gegner.hp - 8.5
        
    }
    // MARK: Brannt/Feuer Attacke
    func dreiKöpfigeHydra(gegner: Gegner) {
        print("Der Magier \(self.name) setzt die Drei Köpfige Hydra gegen \(gegner.name) ein.")
        gegner.hp = gegner.hp - 13.5
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
            self.hp = self.hp + 20
        } else {
            print("Der Magier \(self.name) hat \(held.name) geheilt.")
            held.hp = held.hp + 20
        }
    }
    // MARK: Beutel
    func beutel() {
        print("Beutel")
    }
}
