//
//  Gegner.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung
// MARK: 6. Protokolle implementieren
// MARK: 7. Enums verwenden



class Gegner: Charakter, CustomStringConvertable {
    var description: String {
        return """
\tName: \(self.name)
\tHealthPoints(HP): \(self.hp)
\tAngriffs Punkte: \(self.angriffsPunkte)
\tExtra Schild: \(self.etraSchild)
"""
    }
    
    
    var angriffsPunkte: Double
    var etraSchild: Double
    var status: Status
    
    init(name: String, hp: Double, angriffsPunkte: Double, etraSchild: Double, status: Status) {
        self.angriffsPunkte = angriffsPunkte
        self.etraSchild = etraSchild
        self.status = status
        
        super.init(name: name, hp: hp)
    }
}
