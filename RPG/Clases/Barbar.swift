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
        if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
        }
        // TODO: Print das der schaden durch die Waffe erhöht wurde und die verwdnugsanzahl noch übrig. if anzhal verwendung ist 0 waffe auf nil setzten. Mit print besschied geben wurde so und so oft benutz und ist jetzt kaputt
      
   
    }
    
    // MARK: Reguläre Attacke
    func kraftvollerAnsturm(gegner: Gegner) {
        print("Der Barbar \(self.name) führt die Attacke Kraftvoller Ansturm gegen \(gegner.name) mit einer HP von \(gegner.hp) aus.")
        gegner.nimmSchaden(15 * (waffe?.schadensMultiplier ?? 1))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
        }
        
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
            if self.traegtItem {
                    print("Der Schaden wurde durch die waffe \(waffe?.name) erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung) verfügbar.")
            }
            
        }
    }
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        print("Der Barbar greift \(ziel.name) HP: \(ziel.hp), Extra Schild \(ziel.etraSchild) an! Welche Attacke soll er ausführen?")
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
            beutel()
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    

    
    // MARK: Beutel // rekrusion einbauen damit nicht nur liste ausgegebn wird
    func beutel() {
        print("Beutel")
        print("[1] Trank, Stärke: 10")
        print("[2] Para Heiler, Stärke: 15")
        print("[3] Feuer Heiler, Stärke: 10")
        print("[4] Gift Heiler, Stärke: 10")
        print("[5] Schwert")
        print("[6] Schild")
        print("[7] Eiserne Faust")
        print("[8] Geweite Axt")
        print("[9] Feuer Rune")
        print("[10] Eis Rune")
        print("[11] Gift Rune")
        print("[12] Paralyse Rune")
        print("[13] EisHeiler")
        var tasche: [Beutel] = [Beutel()]
        for (index,tasche) in tasche.enumerated() {
            print("\(index + 1). \(tasche.waffen[0].name)  SchadenMultiplier :\(tasche.waffen[0].schadensMultiplier) Verteidigungswert: \(tasche.waffen[0].verteidigungsWert) Max Verwendung: \(tasche.waffen[0].anzahlVerwendung)")
            print("\(index + 2). \(tasche.waffen[1].name)  SchadenMultiplier :\(tasche.waffen[1].schadensMultiplier) Verteidigungswert: \(tasche.waffen[1].verteidigungsWert) Max Verwendung: \(tasche.waffen[1].anzahlVerwendung)")
            print("\(index + 1). \(tasche.items[0].name)")
        }
        
    }

}
