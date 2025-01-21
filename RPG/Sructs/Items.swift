//
//  Items.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 5. Structs implementieren
// MARK: 6. Protokolle implementieren



struct Item: CustomStringConvertable, Nutzbar {
    var description: String {
        return """
\tName: \(name)
\tSchadenswert: \(schadensWert)
\tVerteidigungswert: \(verteidigungsWert)
\tAnzahl: \(anzahlVerwendung)
"""
    }
    
    let name: String
    let schadensWert: Double
    let verteidigungsWert: Double
    var anzahlVerwendung: Int
    
    func anwenden() {
        if anzahlVerwendung > 0 {
            print("Das Item \(self.name) wurde eingesetzt")
        }
    }
}
