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
        gegner.nimmSchaden(10 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        // TODO: Print das der schaden durch die Waffe erhöht wurde und die verwdnugsanzahl noch übrig. if anzhal verwendung ist 0 waffe auf nil setzten. Mit print besschied geben wurde so und so oft benutz und ist jetzt kaputt
      
   
    }
    
    // MARK: Reguläre Attacke
    func kraftvollerAnsturm(gegner: Gegner) {
        print("Der Barbar \(self.name) führt die Attacke Kraftvoller Ansturm gegen \(gegner.name) mit einer HP von \(gegner.hp) aus.")
        gegner.nimmSchaden(15 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
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
            enemy.nimmSchaden(10 + (waffe?.schadensWert ?? 0))
            waffe?.anzahlVerwendung -= 1
            if self.traegtItem {
                print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
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
            beutel(ziel: ziel, zuHeilen: zuHeilen)
        default:
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
            
        }
    }
    

    
    // MARK: Beutel // rekrusion einbauen damit nicht nur liste ausgegebn wird
    func beutel(ziel: Gegner, zuHeilen: Held) {
        print("Beutel")
        print("[1] Trank, Hp+: 10")
        print("[2] Para Heiler")
        print("[3] Feuer Heiler")
        print("[4] Gift Heiler")
        print("[5] EisHeiler")
        print("[6] Schwert Angr + 10")
        print("[7] Schild Vert + 10")
        print("[8] Eiserne Faust Angr + 10")
        print("[9] Geweite Axt  Angr + 10")
        print("[10] Feuer Rune Angr + 10")
        print("[11] Eis Rune Angr + 10")
        print("[12] Gift Rune Angr + 10")
        print("[13] Paralyse Rune Angr + 10")
        print("[14] Zurück zur Attacken Auswahl")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("\(self.name) setz Trank ein und Heilt sich um 10 Hp")
         self.hp += 10
        case "2":
            print("\(self.name) setzt Para Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "3":
            print("\(self.name) setzt Feuer Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "4":
            print("\(self.name) setzt Gift Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "5":
            print("\(self.name) setzt Eis Heiler ein und ist nicht mehr Vereist")
            self.status = .gesund
        case "6":
            print("\(self.name) nimmt das Schwert. Sein nächster Angriff macht macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "7":
            print("\(self.name) blockiert den nächsten Angriff mit Schwert Block um 10 erhöht")
            self.blockWert += 10
        case "8":
            print("\(self.name) nimmt die Eiserne Faust. Sein nächster Angriff Macht 10 extra Schaden")
            self.angriffsPunkte += 10
        case "9":
            print("\(self.name) nimmt die Geweite Axt. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "10":
            print("\(self.name) nimmt die Feuer Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "11":
            print("\(self.name)  nimmt die Eis Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "12":
            print("\(self.name)  nimmt die Gift Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "13":
            print("\(self.name)  nimmt die Paralyse Rune. Sein nächster Angriff Macht 10  extra Schaden")
            self.angriffsPunkte += 10
        case "14":
            print("\(self.name) geht zur Attacken Auswahl zurück")
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        default:
            beutel(ziel: ziel, zuHeilen: zuHeilen)
            
        }
            
    }

}



//        var tasche: [Beutel] = [Beutel()]
//        for (index,tasche) in tasche.enumerated() {
//            print("\(index + 1). \(tasche.waffen[0].name)  SchadenMultiplier :\(tasche.waffen[0].schadensMultiplier) Verteidigungswert: \(tasche.waffen[0].verteidigungsWert) Max Verwendung: \(tasche.waffen[0].anzahlVerwendung)")
//            print("\(index + 2). \(tasche.waffen[1].name)  SchadenMultiplier :\(tasche.waffen[1].schadensMultiplier) Verteidigungswert: \(tasche.waffen[1].verteidigungsWert) Max Verwendung: \(tasche.waffen[1].anzahlVerwendung)")
//            print("\(index + 1). \(tasche.items[0].name)")
//        }
