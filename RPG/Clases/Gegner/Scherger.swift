//
//  Scherger.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4.1 Gegner-Schergen im Kampf hinzufügen
import Foundation


class Scherger: Gegner {
    
    var statusCounter: Int = 0
    
    // MARK: Heil Attacke
    func heilPfeil(zuHeilen: Gegner) {
        if zuHeilen.name == self.name {
            print("\(self.name) setzt \(blinken)❤️🏹🏹Heilfpleil❤️🏹🏹\(reset) ein und hat sich Selbst geheilt ❤️. Mit einem Rest von Hp \(self.hp)❤️.")
            self.heilung(20)
            playSound(path: heilenSound)
            Thread.sleep(forTimeInterval: 1.0)
            audioPlayer?.stop()
    
        } else {
            print("\(self.name) setzt \(blinken)❤️🏹🏹Heilfpleil❤️🏹🏹\(reset) ein heilt \(zuHeilen.name) mit einer Hp von \(zuHeilen.hp)❤️.")
            zuHeilen.heilung(20)
            playSound(path: heilenSound)
            Thread.sleep(forTimeInterval: 1.0)
            audioPlayer?.stop()
            
        }
        
    }
    
    // MARK: Eis Attacke
    func eisPfeil(held: Held) {
        print("\(self.name) schießt ein \(blinken)❄️🏹🏹Eis Pfeil❄️🏹🏹\(reset) auf \(held.name) mit einer HP von \(held.hp)❤️")
        held.nimmSchaden(10)
        playSound(path: frostStrahlSound)
        Thread.sleep(forTimeInterval: 1.0)
        audioPlayer?.stop()
       
        let random: Int = Int.random(in: 1...5)
        if random == 3 {
            print("\(held.name) wurde für 2 Runden vereist ❄️❄️ ")
            held.status = .vereist
            
        }
        
    }
    
    // MARK: Paralyse Attacke
    func paralysePfeil(held: Held) {
        print("\(self.name) schießt ein \(blinken)⚡️🏹🏹Paralyse Pfeil⚡️🏹🏹\(reset) auf \(held.name) mit einer HP von \(held.hp)❤️")
        held.nimmSchaden(9.5)
        playSound(path: paralyseBombeSound)
        Thread.sleep(forTimeInterval: 1.0)
        audioPlayer?.stop()
        let random: Int = Int.random(in: 1...5)
        if random == 2 {
            print("\(held.name) wurde für 2 Runden paralysiert ⚡️⚡️")
            held.status = .paralysiert
            
        }
    }
    
    // MARK: Gift Attacke
    func giftPfeil(held: Held) {
        print("\(self.name) schießt ein \(blinken)☠️🏹🏹Gift Pfeil auf☠️🏹🏹\(reset) \(held.name) mit einer HP von \(held.hp)❤️")
        held.nimmSchaden(10.5)
        playSound(path: giftPfeilSound)
        Thread.sleep(forTimeInterval: 1.0)
        audioPlayer?.stop()
        let random: Int = Int.random(in: 1...5)
        if random == 1 {
            print("\(held.name) wurde für 2 Runden vergiftet ☠️☠️")
            held.status = .vergiftet
        }
    }
    
    override func aktionsMenue(ziele: [Held], zuHeilen: [Gegner]) {
        
        if statusCounter < 2 && status == .paralysiert || status == .vereist {
            print("\(self.name) ist \(status.rawValue) er kann 2 Runden nicht angreifen")
            statusCounter += 1
        } else {
            if status == .vergiftet || status == .brennt {
            print("\(self.name) ist \(status.rawValue) er verliert 2 Runden 10 % seines Lebens❤️ ")
                print("\(self.name) wurden \(self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)❤️ Hp abgezogen. Rest Hp \(max(self.hp.zweiStellenNachKomma - self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma,0))❤️")
            self.hp = self.hp.zweiStellenNachKomma - (self.hp.zweiStellenNachKomma * 0.1.zweiStellenNachKomma)
           
            
            statusCounter += 1
            
        }
            print(" \(self.name) greift an!")
            
            let input: String = String(Int.random(in: 1...4))
            
            switch input {
            case "1":
                heilPfeil(zuHeilen: zuHeilen.randomElement()!)
            case "2":
                eisPfeil(held: ziele.randomElement()!)
            case "3":
                paralysePfeil(held: ziele.randomElement()!)
            case "4":
                giftPfeil(held: ziele.randomElement()!)
            default:
                aktionsMenue(ziele: ziele, zuHeilen: zuHeilen)
                
            }
        }
        
        
    }
}
