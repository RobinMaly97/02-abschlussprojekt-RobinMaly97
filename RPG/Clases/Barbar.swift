//
//  Barbar.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Barbar: Held {
    

    
    // MARK: Reguläre Attacke
    func seismischesSchmettern(gegner: Gegner) {
        
        print("Der Barbar \(self.name) führt die Attacke Seismisches Schmettern gegen \(gegner.name) mit einer HP von \(gegner.hp) aus.")
        gegner.nimmSchaden(10 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        // TODO: Print das der schaden durch die Waffe erhöht wurde und die verwdnugsanzahl nohc übrig. if anzhal verwendung ist 0 waffe auf nil setzten. Mit print besschied geben wurde so und so oft benutz und ist jetzt kaputt
        print("Der Gegner \(gegner.name) verliert 10 HP, Rest HP \(gegner.hp).")
   
    }
    
    // MARK: Reguläre Attacke
    func kraftvollerAnsturm(gegner: Gegner) {
        print("Der Barbar \(self.name) führt die Attacke Kraftvoller Ansturm gegen \(gegner.name) mit einer HP von \(gegner.hp) aus.")
        gegner.nimmSchaden(25 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        print("Der Gegner \(gegner.name) verliert 15 HP, Rest HP \(gegner.hp).")
    }
    // MARK: Block Attacke
    func schwertBlock() {
        print("Der Barbar \(self.name) blockt die nächste Attacke mit 10 Punkten.")
        blockWert = blockWert + 10
    }
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func erdbeben(gegner: [Gegner]) {
        print("Der Barbar \(self.name) führt die Attacke Erdbeben aus.")
        print("Alle gegner werden getroffen.")
        for enemy in gegner {
            enemy.nimmSchaden(10 * (waffe?.schadensMultiplier ?? 1))
            waffe?.anzahlVerwendung -= 1
            print("Der Gegner \(enemy.name) verliert 10 HP, Rest HP \(enemy.hp).")
        }
    }
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Barbar greift \(ziel.name) HP: (\(ziel.hp) an! Welche Attacke soll er ausführen?")
        print("[1] Seismisches Schmettern, Stärke: 10")
        print("[2] Kraftvoller Ansturm, Stärke: 15")
        print("[3] Schwert Block, Stärke: 10")
        print("[4] Erdbeeben, Stärke: 10")
        print("[5] Beutel öffnen")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("Barbar greift mit Seismisches Schmettern an")
            seismischesSchmettern(gegner: ziel)
        case "2":
            print("Barbar greift mit Kraftvoller Ansturm an")
            kraftvollerAnsturm(gegner: ziel)
        case "3":
            print("Barbar blockiert den nächsten Angriff mit Schwert Block")
            schwertBlock()
        case "4":
            print("Barbar greift mit Erdbeeben an")
            erdbeben(gegner: [ziel])
        case "5":
            print("barbar öffnet den Beutel")
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    

    
    // MARK: Beutel
    func beutel() {
        print("Beutel")
        
    }

}
