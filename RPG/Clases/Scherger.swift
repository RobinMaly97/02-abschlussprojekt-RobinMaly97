//
//  Scherger.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4.1 Gegner-Schergen im Kampf hinzufügen

class Scherger: Gegner {
    
    // MARK: Heil Attacke
    func heilPfeil(zuHeilen: Endgegner) {
        if zuHeilen.name == self.name {
            print("Der Scherger \(self.name) hat sich Selbst geheilt.")
            self.hp = self.hp + 20
        } else {
            print("Der Scherger \(self.name) hat \(zuHeilen.name) geheilt.")
            zuHeilen.hp = zuHeilen.hp + 20
        }
        print("Scherger setzt Heil Pfeil ein")
        print("\(zuHeilen.name) bekommt 10 hp dazu!!")
        zuHeilen.hp = zuHeilen.hp + 10
        
    }
    
    // MARK: Eis Attacke
    func eisPfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Eis Pfeil auf \(held.name)")
        held.hp = held.hp - 10
        let random: Int = Int.random(in: 1...10)
        if random == 1 {
            print("Der Held \(held.name) wurde für 2 Runden vereist")
            held.status = .vereist
           
        }
    
    }
    
    // MARK: Paralyse Attacke
    func paralysePfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Paralyse Pfeil auf \(held.name)")
        held.hp = held.hp - 9.5
        let random: Int = Int.random(in: 1...10)
        if random == 8 {
            print("Der Held \(held.name) wurde für 2 Runden paralysiert")
            held.status = .paralysiert
           
        }
    }
    
    // MARK: Gift Attacke
    func giftPfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Gift Pfeil auf \(held.name)")
        held.hp = held.hp - 10.5
        let random: Int = Int.random(in: 1...10)
        if random == 10 {
            print("Der Held \(held.name) wurde für 2 Runden vergiftet")
            held.status = .vergiftet
        }
    }
}
