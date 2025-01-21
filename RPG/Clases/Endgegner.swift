//
//  Endgegner.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung
// MARK: 4.1 Gegner-Schergen im Kampf hinzufügen



class Endgegner: Gegner {
    
    // MARK: Reguläre Attacke
    func meteorSchlag(held: Held) {
        print("\(self.name) setzt Meteor Schlag gegen \(held.name) ein.")
        held.nimmSchaden(20)
      
    }
    
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func flammenInferno(helden: [Held]) {
        print("\(self.name) setz Flammen Inferno ein in trifft alle Helden.")
        for held in helden {
            held.nimmSchaden(15)
            
        }
        
    }
    
    // MARK: One Hit Attacke (Bombastischer Angriff)
    func zornDesTeufels(held: Held) {
        var maxAngriffe: Int = 1
        if maxAngriffe == 1 && masterAttackCounter >= 10 {
            print("\(self.name) setzt Zorn des Teufels gegen \(held.name) ein.")
            held.nimmSchaden(held.hp)
            maxAngriffe -= 1
        }
       
    }
    
    
    
    // MARK: Scherger Beschwörung
    // 4.1 Gegner-Schergen im Kampf hinzufügen
    // durch die if bedingung wird diese Funktion/Attacke erst aufgerufen/funktionieren wenn die HP vom Endgegner weniger gleich als die Hälfte ist

    func schergenBeschwören() {
        var maxBeschwoerung: Int = 0
        if maxBeschwoerung < 1 &&  self.hp <= self.hp / 2 {
                print("Der Scherger wird beschworen und kommt \(self.name) zur hilfe.")
                let scherger: Scherger = Scherger(name: "Duriel", hp: 50, angriffsPunkte: 15, etraSchild: 0, status: .gesund)
            
         //   gegner.append(contentsOf: scherger) wie kriege ich zugriff auf das gegner Array?
            maxBeschwoerung += 1
        }
       
    }
    
    override func aktionsMenue(ziele: [Held], zuHeilen: [Gegner]) {
       
        print("\(self.name) greift an!")
        
        let input: String = String(Int.random(in: 1...4))
        
        switch input {
        case "1":
            print("Endgegner \(self.name) setzt Meteor Schlag ein.")
            meteorSchlag(held: ziele.randomElement()!)
        case "2":
            print("Endgegner \(self.name) setz Flammen Inferno ein")
            flammenInferno(helden: ziele)
        case "3":
            print("Endgegner \(self.name) setzt Zorn des Teufels ein")
            zornDesTeufels(held: ziele.randomElement()!)
        case "4":
            print("Endgegner \(self.name) beschwört ein Scherger")
            schergenBeschwören()
        default:
            aktionsMenue(ziele: ziele, zuHeilen: zuHeilen)
            
        }
    }
}
