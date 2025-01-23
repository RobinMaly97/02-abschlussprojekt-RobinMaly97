//
//  Endgegner.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung
// MARK: 4.1 Gegner-Schergen im Kampf hinzufügen



class Endgegner: Gegner {
    
    var statusCounter: Int = 0
    let halbHp: Double = 75.0
    // MARK: Reguläre Attacke
    func meteorSchlag(held: Held) {
        held.nimmSchaden(20)
        
    }
    
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func flammenInferno(helden: [Held]) {
        
        for held in helden {
            held.nimmSchaden(15)
            print()
            
        }
        
    }
    
    // MARK: One Hit Attacke (Bombastischer Angriff)
    func zornDesTeufels(held: Held) {
        var maxAngriffe: Int = 1
        if statusCounter < 2 && status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            // if status == .vegiftet || status == .brennt {  print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")}
            statusCounter += 1
        } else if maxAngriffe == 1 && masterAttackCounter >= 10 {
            print("\(self.name) setzt Zorn des Teufels gegen \(held.name) ein.")
            held.nimmSchaden(held.hp)
            maxAngriffe -= 1
        }
        
    }
    
    
    
    // MARK: Scherger Beschwörung
    // 4.1 Gegner-Schergen im Kampf hinzufügen
    // durch die if bedingung wird diese Funktion/Attacke erst aufgerufen/funktionieren wenn die HP vom Endgegner weniger gleich als die Hälfte ist
    var schergerBeschworen: Bool = false
    
    func schergenBeschwören() -> Scherger? {
        if statusCounter < 2 && status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            // if status == .vegiftet || status == .brennt {  print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")}
            statusCounter += 1
        }
        
        
        else if !schergerBeschworen {
            print("Der Scherger wird beschworen und kommt \(self.name) zur hilfe.")
            var scherger: Scherger = Scherger(name: "Duriel", hp: 100.zweiStellenNachKomma, angriffsPunkte: 15, etraSchild: 0, status: .gesund)
            schergerBeschworen = true
            return scherger
        }
        return nil
    }
    var maxAngriffe: Int = 1
    override func aktionsMenue(ziele: [Held], zuHeilen: [Gegner]) {
        
        print("\(self.name) greift an!")
        
        
        
        if maxAngriffe == 1 && masterAttackCounter >= 10 {
            let heldZiel = ziele.randomElement()!
            print("\(self.name) setzt Zorn des Teufels gegen \(heldZiel.name) ein.")
            heldZiel.nimmSchaden(heldZiel.hp)
            maxAngriffe -= 1
            
            
        } else {
            if statusCounter < 2 && status == .paralysiert || status == .vereist {
                print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
                // if status == .vegiftet || status == .brennt {  print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")}
                statusCounter += 1
            } else {
                if status == .vergiftet || status == .brennt {
                    print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens ")
                    print("\(self.name) wurden \(self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma) Hp abgezogen. Rest Hp \(self.hp.zweiStellenNachKomma - self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)")
                    self.hp = self.hp.zweiStellenNachKomma - (self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)
                    
                    
                    statusCounter += 1
                    
                }
                
                
                
                let input: String = String(Int.random(in: 1...2))
                
                switch input {
                case "1":
                    print("Endgegner \(self.name) setzt Meteor Schlag ein.")
                    meteorSchlag(held: ziele.randomElement()!)
                case "2":
                    print("Endgegner \(self.name) setz Flammen Inferno ein")
                    flammenInferno(helden: ziele)
                    
                default:
                    aktionsMenue(ziele: ziele, zuHeilen: zuHeilen)
                }
            }
        }
    }
}
