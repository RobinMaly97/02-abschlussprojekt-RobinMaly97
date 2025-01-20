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
        held.hp = held.hp - 20
    }
    
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func flammenInferno(helden: [Held]) {
        print("\(self.name) setz Flammen Inferno ein in trifft alle Helden.")
        for held in helden {
            self.hp = self.hp - 15
        }
        
    }
    
    // MARK: One Hit Attacke (Bombastischer Angriff)
    func zornDesTeufels(held: Held) {
        print("\(self.name) setzt Zorn des Teufels gegen \(held.name) ein.")
        held.hp = held.hp - held.hp
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
}
