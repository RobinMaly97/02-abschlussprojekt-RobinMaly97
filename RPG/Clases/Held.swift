//
//  Held.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung
// MARK: 6. Protokolle implementieren
// MARK: 7. Enums verwenden



class Held: Charakter, CustomStringConvertable {
    var description: String {
        return """
\tName: \(self.name)
\tHealthPoints(HP): \(self.hp)
\tAngriffs Punkte: \(self.angriffsPunkte)
\tVerteidigungs Punkte: \(self.verteidigungsPunkte)
"""
    }
    
    
    var angriffsPunkte: Double
    var verteidigungsPunkte: Double
    var status: Status
    
    init(name: String, hp: Double, angriffsPunkte: Double, verteidigungsPunkte: Double, status: Status) {
        self.angriffsPunkte = angriffsPunkte
        self.verteidigungsPunkte = verteidigungsPunkte
        self.status = status
        
        super.init(name: name, hp: hp)
    }
}
