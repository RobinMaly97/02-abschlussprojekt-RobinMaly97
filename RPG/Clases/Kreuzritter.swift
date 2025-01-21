//
//  Kreuzritter.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Kreuzritter: Held {
    
    // MARK: Reguläre Attacke
    func schwungAngriff(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit dem Schwung Angriff an")
        gegner.nimmSchaden(10)
        print("Der Gegner \(gegner.name) verliert 10 HP, Rest HP \(gegner.hp).")
    }
    // MARK: Reguläre Attacke
    func himmelsFaust(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit der Himmels Faust an")
        gegner.nimmSchaden(5)
        print("Der Gegner \(gegner.name) verliert 5 HP, Rest HP \(gegner.hp).")
    }
    // MARK: Reguläre Attacke
    func gesegneterHammer(gegner: Gegner) {
        print("Der Kreuzritter \(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit dem Gesegnetem Hammer an")
        gegner.nimmSchaden(7.5)
        print("Der Gegner \(gegner.name) verliert 7.5 HP, Rest HP \(gegner.hp).")
    }
    // MARK: Block Attacke
    func schildBlock() {
        print("Der Kreuzritter \(self.name) Blockt die nächste attacke mit 10 Punkten")
        blockWert = blockWert + 10
        
    }
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Kreuzritter greift an! Welche Attacke soll er ausführen?")
        print("[1] Schwung Angriff, Stärke: 10")
        print("[2] Himmelsfaust, Stärke: 5")
        print("[3] Gesegneter Hammer, Stärke: 7.5")
        print("[4] Schild Block, Stärke: 10")
        print("[5] Beutel öffnen")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Kreuzritter greift mit Schwung Angriff an")
            schwungAngriff(gegner: ziel)
        case "2":
            print("Kreuzritter greift mit Himmelsfaust an")
            himmelsFaust(gegner: ziel)
        case "3":
            print("Kreuzritter greift mit Gesegneter Hammer an")
            gesegneterHammer(gegner: ziel)
        case "4":
            print("Kreuzritter blockiert den nächsten Angriff mit Schild Block")
            schildBlock()
        case "5":
            print("barbar öffnet den Beutel")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    
    
    // MARK: Beutel
    func beutel() {
//        for (index,item) in Beutel.enumerated() {
//
//        }
    }
}
