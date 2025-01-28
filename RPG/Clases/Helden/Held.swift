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
    
    
    var angriffsPunkte: Double //   get {self.angriffsPunkte *= waffe}} //
    
    var verteidigungsPunkte: Double
    var status: Status{
        didSet {
            
            switch status {
            case .brennt:
                print("\(self.name) ist am 🔥brennen🔥")
            case .paralysiert:
                print("\(self.name) ist ⚡️paralysiert⚡️")
            case .vereist:
                print("\(self.name) ist ❄️vereist❄️")
            case .vergiftet:
                print("\(self.name) ist ☠️vergiftet☠️")
            case .gesund:
                print("\(self.name) ist wieder ❤️Gesund❤️ ")
            }
        }
    }
    var beutel: Beutel = Beutel()
    var blockWert: Double = 0
    var traegtItem: Bool = false
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
        if self.blockWert > 0{
            self.blockWert -= schaden
            print("\(self.name) verliert \(schaden) Block Wert🛡️, Rest Schild🛡️ \(max(self.blockWert,0))")
        }
        
        if self.blockWert <= 0 {
            self.hp -= schaden + (self.waffe?.schadensWert ?? 0)
                self.waffe?.anzahlVerwendung -= 1
                print("\(self.name) verliert \(schaden) Hp❤️, Rest HP \(max(self.hp,0))❤️")
        }
            
            
        
        if self.hp <= 0 {
            print("☠️ \(self.name) ist besiegt☠️")
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
