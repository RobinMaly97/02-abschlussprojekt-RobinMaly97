//
//  Held.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Held: Charakter {
    
    var angriffsPunkte: Double
    var verteidigungsPunkte: Double
    
    init(name: String, hp: Double, angriffsPunkte: Double, verteidigungsPunkte: Double) {
        self.angriffsPunkte = angriffsPunkte
        self.verteidigungsPunkte = verteidigungsPunkte
        
        super.init(name: name, hp: hp)
    }
}
