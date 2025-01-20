//
//  Kreuzritter.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Kreuzritter: Held {
    
    // MARK: Reguläre Attacke
    func schwungAngriff(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit dem Schwung Angriff an")
        gegner.hp = gegner.hp - 10
    }
    // MARK: Reguläre Attacke
    func himmelsFaust(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit der Himmels Faust an")
        gegner.hp = gegner.hp - 5
    }
    // MARK: Reguläre Attacke
    func gesegneterHammer(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit dem Gesegnetem Hammer an")
        gegner.hp = gegner.hp - 7.5
    }
    // MARK: Block Attacke
    func schildBlock() {
        print("Der Kreuzritter \(self.name) Blockt die nächste attacke")
    }
    // MARK: Beutel
    func beutel() {
        
    }
}
