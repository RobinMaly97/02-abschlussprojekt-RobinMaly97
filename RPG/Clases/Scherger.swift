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
            print("Der Scherger \(self.name) hat sich Selbst geheilt. Mit einem Rest von Hp \(self.hp).")
            self.heilung(20)
            
        } else {
            print("Der Scherger \(self.name) heilt \(zuHeilen.name) mit einer Hp von \(zuHeilen.hp).")
            zuHeilen.heilung(20)
            
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
    
    override func aktionsMenue(ziele: [Held], zuHeilen: [Gegner]) {
        
        if status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            // if status == .vegiftet || status == .brennt {  print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")}
        } else {
            print(" \(self.name) greift an!")
            
            let input: String = String(Int.random(in: 1...4))
            
            switch input {
            case "1":
                print("Scherger \(self.name) setzt Heil Pfeil ein.")
                heilPfeil(zuHeilen: zuHeilen.randomElement()!)
            case "2":
                print("Scherger \(self.name) setz Eis Pfeil ein")
                eisPfeil(held: ziele.randomElement()!)
            case "3":
                print("Scherger \(self.name) setzt Paralyse Pfeil ein")
                paralysePfeil(held: ziele.randomElement()!)
            case "4":
                print("Scherger \(self.name) setz Gift Pfeil ein")
                giftPfeil(held: ziele.randomElement()!)
            default:
                aktionsMenue(ziele: ziele, zuHeilen: zuHeilen)
                
            }
        }
        
        
    }
}
