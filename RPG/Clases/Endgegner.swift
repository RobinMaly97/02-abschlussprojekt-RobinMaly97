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
        print("Der Held \(held.name) verliert 20 HP, Rest HP \(held.hp)")
    }
    
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func flammenInferno(helden: [Held]) {
        print("\(self.name) setz Flammen Inferno ein in trifft alle Helden.")
        for held in helden {
            self.nimmSchaden(15)
            print("Der Held \(held.name) verliert 15 HP, Rest HP \(held.hp)")
        }
        
    }
    
    // MARK: One Hit Attacke (Bombastischer Angriff)
    func zornDesTeufels(held: Held) {
        print("\(self.name) setzt Zorn des Teufels gegen \(held.name) ein.")
        held.nimmSchaden(held.hp)
        print("Der Held \(held.name) wurde besiegt Rest HP \(held.hp) ")
    }
    
    
    
    // MARK: Scherger Beschwörung
    // 4.1 Gegner-Schergen im Kampf hinzufügen
    // durch die if bedingung wird diese Funktion/Attacke erst aufgerufen/funktionieren wenn die HP vom Endgegner weniger gleich als die Hälfte ist

    func schergenBeschwören() {
        var maxBeschwoerung: Int = 0
        if maxBeschwoerung < 1 {
            if self.hp <= self.hp / 2 {
                print("Der Scherger wird beschworen und kommt \(self.name) zur hilfe.")
                let scherger: Scherger = Scherger(name: "Duriel", hp: 50, angriffsPunkte: 15, etraSchild: 0, status: .gesund)
            }
            maxBeschwoerung += 1
        }
       
    }
    
    override func aktionsMenue(ziel: Held, zuHeilen: Gegner) {
       
        print("Der Endgegner \(self.name) greift an!")
        
        let input: String = String(Int.random(in: 1...4))
        
        switch input {
        case "1":
            print("Endgegner \(self.name) setzt Meteor Schlag ein.")
            meteorSchlag(held: ziel)
        case "2":
            print("Endgegner \(self.name) setz Flammen Inferno ein")
            flammenInferno(helden: [ziel])
        case "3":
            print("Endgegner \(self.name) setzt Zorn des Teufels ein")
            zornDesTeufels(held: ziel)
        case "4":
            print("Endgegner \(self.name) beschwört ein Scherger")
            schergenBeschwören()
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
}
