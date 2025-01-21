//
//  Scherger.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4.1 Gegner-Schergen im Kampf hinzufügen

class Scherger: Gegner {
    
    // MARK: Heil Attacke
    func heilPfeil(zuHeilen: Gegner) {
        if zuHeilen.name == self.name {
            print("Der Scherger \(self.name) hat sich Selbst geheilt.")
            self.heilung(20)
        } else {
            print("Der Scherger \(self.name) heilt \(zuHeilen.name) mit einer Hp von \(zuHeilen.hp).")
            zuHeilen.heilung(20)
            print("Die Hp von \(zuHeilen.name) ist auf \(zuHeilen.hp) gestiegen")
        }
        
    }
    
    // MARK: Eis Attacke
    func eisPfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Eis Pfeil auf \(held.name)")
        held.nimmSchaden(10)
        print("Der Held \(held.name) verliert 10 HP, Rest HP \(held.hp)")
        let random: Int = Int.random(in: 1...10)
        if random == 1 {
            print("Der Held \(held.name) wurde für 2 Runden vereist")
            held.status = .vereist
           
        }
    
    }
    
    // MARK: Paralyse Attacke
    func paralysePfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Paralyse Pfeil auf \(held.name)")
        held.nimmSchaden(9.5)
        print("Der Held \(held.name) verliert 9.5 HP, Rest HP \(held.hp)")
        let random: Int = Int.random(in: 1...10)
        if random == 8 {
            print("Der Held \(held.name) wurde für 2 Runden paralysiert")
            held.status = .paralysiert
           
        }
    }
    
    // MARK: Gift Attacke
    func giftPfeil(held: Held) {
        print("Der Scherger \(self.name) schießt ein Gift Pfeil auf \(held.name)")
        held.nimmSchaden(10.5)
        print("Der Held \(held.name) verliert 10.5 HP, Rest HP \(held.hp)")
        let random: Int = Int.random(in: 1...10)
        if random == 10 {
            print("Der Held \(held.name) wurde für 2 Runden vergiftet")
            held.status = .vergiftet
        }
    }
    
    override func aktionsMenue(ziel: Held, zuHeilen: Gegner) {
       
        print("Der Scherger \(self.name) greift an!")
        
        let input: String = String(Int.random(in: 1...4))
        
        switch input {
        case "1":
            print("Scherger \(self.name) setzt Heil Pfeil ein.")
            heilPfeil(zuHeilen: zuHeilen)
        case "2":
            print("Endgegner \(self.name) setz Flammen Inferno ein")
            eisPfeil(held: ziel)
        case "3":
            print("Endgegner \(self.name) setzt Zorn des Teufels ein")
            paralysePfeil(held: ziel)
        case "4":
            print("Endgegner \(self.name) beschwört ein Scherger")
            giftPfeil(held: ziel)
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
}
