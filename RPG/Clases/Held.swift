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
    var blockWert: Double = 0
    var waffe: Waffe?
    var item: Item?

    /*
     SChlau wäre:
     in der helden mutter attacke1,2,3,4,5 vari
     */
    init(name: String, hp: Double, angriffsPunkte: Double, verteidigungsPunkte: Double, status: Status) {
        self.angriffsPunkte = angriffsPunkte
        self.verteidigungsPunkte = verteidigungsPunkte
        self.status = status
        
        super.init(name: name, hp: hp)
    }
    
    func nimmSchaden(_ schaden: Double) {
            
            self.hp -= schaden - (self.waffe?.verteidigungsWert ?? 0)
            self.waffe?.anzahlVerwendung -= 1
            print("Der Held \(self.name) verliert \(schaden) Hp, Rest HP \(self.hp)")
            
            
        
        if self.hp <= 0 {
            print("\(self.name) ist besiegt")
        }
    }
    
    
    func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Barbar greift an! Welche Attacke soll er ausführen?")
        print("[1] Seismisches Schmettern, Stärke: 10")
        print("[2] Kraftvoller Ansturm, Stärke: 15")
        print("[3] Schwert Block, Stärke: 10")
        print("[4] Erdbeeben, Stärke: 10")
        print("[5] Beutel öffnen")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Barbar greift")
          
        case "2":
            print("Bitte Wähle mindestens 2 Helden aus.")
        case "3":
            print("Alle HIGHSCORES")
        case "4":
            print("Spiel Beendet")
        case "5":
            print("barbar öffnet den Beutel")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
   
}
