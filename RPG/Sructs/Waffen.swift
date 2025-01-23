//
//  Waffen.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 5. Structs implementieren
// MARK: 6. Protokolle implementieren



struct Waffe: CustomStringConvertable, Nutzbar {
    
    var description: String {
        return """
\tName: \(name)
\tSchadens Multiplier: \(schadensWert)
\tVerteidigungs Wert: \(verteidigungsWert)
\tAnzahl Verwendungen: \(anzahlVerwendung)
"""
    }
    
    let name: String
    var schadensWert: Double
    let verteidigungsWert: Double
    var anzahlVerwendung: Int
    
    
    func anwenden() {
        if anzahlVerwendung > 0 {
            print("Das Item \(self.name) wurde eingesetzt")
        }
    }
    
    
}

