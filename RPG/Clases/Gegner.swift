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
    
    func aktionsMenue(ziel: Held, zuHeilen: Gegner) {
        print("Der gegner greift an!")
        
        let input: String = String(Int.random(in: 1...4))
        
        switch input {
        case "1":
            print("Barbar greift")
          
        case "2":
            print("Bitte Wähle mindestens 2 Helden aus.")
        case "3":
            print("Alle HIGHSCORES")
        case "4":
            print("Spiel Beendet")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
}
