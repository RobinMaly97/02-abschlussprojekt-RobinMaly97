//
//  Waffen.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 5. Structs implementieren
// MARK: 6. Protokolle implementieren



struct Waffe: CustomStringConvertable {
    var description: String {
        return """
\tName: \(name)
\tSchadens Multiplier: \(schadensMultiplier)
\tVerteidigungs Wert: \(verteidigungsWert)
\tAnzahl Verwendungen: \(anzahlVerwendung)
"""
    }
    
    let name: String
    let schadensMultiplier: Double
    let verteidigungsWert: Double
    var anzahlVerwendung: Int
    
    
}

