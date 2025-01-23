//
//  Kreuzritter.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Kreuzritter: Held {
    
    var statusCounter: Int = 0
    

    
    
    // MARK: Reguläre Attacke
    func schwungAngriff(gegner: Gegner) {
        print("\(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit dem Schwung Angriff an")
        gegner.nimmSchaden(10 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
      
    }
    // MARK: Reguläre Attacke
    func himmelsFaust(gegner: Gegner) {
        print("\(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit der Himmels Faust an")
        gegner.nimmSchaden(5 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
      
    }
    // MARK: Reguläre Attacke
    func gesegneterHammer(gegner: Gegner) {
        print("\(self.name) greift \(gegner.name) mit einer HP von \(gegner.hp) mit dem Gesegnetem Hammer an")
        gegner.nimmSchaden(7.5 + (waffe?.schadensWert ?? 0))
        waffe?.anzahlVerwendung -= 1
        if self.traegtItem {
            print("Der Schaden wurde durch die waffe \(waffe?.name ?? "Keine Waffe Ausgerüstet") Keine Waffe Ausgerüstet erhöht und die Waffe ist noch \(waffe?.anzahlVerwendung ?? 0) verfügbar.")
        }
        
    }
    // MARK: Block Attacke
    func schildBlock() {
        print("Der Kreuzritter \(self.name) Blockt die nächste attacke mit 10 Punkten")
        blockWert = blockWert + 10
        
    }
    
    override func aktionsMenue(ziel: Gegner, zuHeilen: Held) {
        if statusCounter < 2 && status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            statusCounter += 1
        } else {
            if status == .vergiftet || status == .brennt {
            print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")
                print("\(self.name) wurden \(self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma) Hp abgezogen. Rest Hp \(self.hp.zweiStellenNachKomma - self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)")
            self.hp = self.hp.zweiStellenNachKomma - (self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)
          
            
            statusCounter += 1
            
        }
            print("Der Kreuzritter greift \(ziel.name) HP: \(ziel.hp), Extra Schild \(ziel.etraSchild) an! Welche Attacke soll er ausführen?")
            print("[1] Schwung Angriff, Stärke: 10")
            print("[2] Himmelsfaust, Stärke: 5")
            print("[3] Gesegneter Hammer, Stärke: 7.5")
            print("[4] Schild Block, Stärke: 10")
            print("[5] Beutel öffnen")
            
            let input: String = readLine()!
            
            switch input {
            case "1":
                schwungAngriff(gegner: ziel)
            case "2":
                himmelsFaust(gegner: ziel)
            case "3":
                gesegneterHammer(gegner: ziel)
            case "4":
                schildBlock()
            case "5":
                print("\(self.name) öffnet den Beutel")
                beutel(ziel: ziel, zuHeilen: zuHeilen)
            default:
                aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
                
            }
        }
        
     
    }
    
    
    // MARK: Beutel
    func beutel(ziel: Gegner, zuHeilen: Held) {
        print("Beutel")
        print("[1] Trank, Hp+: 10")
        print("[2] Feuer Heiler")
        print("[3] Gift Heiler")
        print("[4] Schwert Angr + 10")
        print("[5] Schild Vert + 10")
        print("[6] Eiserne Faust Angr + 10")
        print("[7] Geweite Axt  Angr + 10")
        print("[8] Zurück zur Attacken Auswahl")
        
        let input: String = readLine()!
        
        switch input {
        case "1":
            print("\(self.name) setz Trank ein und Heilt sich um 10 Hp")
         self.hp += 10
        case "2":
            print("\(self.name) setzt Feuer Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "3":
            print("\(self.name) setzt Gift Heiler ein und ist wieder Gesund")
            self.status = .gesund
        case "4":
            print("\(self.name) nimmt das Schwert. Sein nächster Angriff macht macht 10  extra Schaden")
            self.waffe = beutel.waffen[0]
            self.waffe?.schadensWert += 10
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        case "5":
            print("\(self.name) blockiert den nächsten Angriff mit Schild  um 10 erhöht")
            self.waffe = beutel.waffen[1]
            self.blockWert += 10
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        case "6":
            print("\(self.name) nimmt die Eiserne Faust. Sein nächster Angriff Macht 10 extra Schaden")
            self.waffe = beutel.waffen[2]
            self.waffe?.schadensWert += 10
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        case "7":
            print("\(self.name) nimmt die Geweite Axt. Sein nächster Angriff Macht 10  extra Schaden")
            self.waffe = beutel.waffen[3]
            self.waffe?.schadensWert += 10
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        case "8":
            print("\(self.name) geht zur Attacken Auswahl zurück")
            aktionsMenue(ziel: ziel, zuHeilen: zuHeilen)
        default:
            beutel(ziel: ziel, zuHeilen: zuHeilen)
            
        }
            
    }


}
