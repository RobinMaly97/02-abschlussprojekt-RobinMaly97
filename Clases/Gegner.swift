//
//  Gegner.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Gegner: Charakter {
    
    var angriffsPunkte: Double
    var etraSchild: Double = 50
    
    init(name: String, hp: Double, angriffsPunkte: Double, etraSchild: Double) {
        self.angriffsPunkte = angriffsPunkte
        self.etraSchild = etraSchild
        
        super.init(name: name, hp: hp)
    }
}
