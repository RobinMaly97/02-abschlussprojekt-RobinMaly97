//
//  Scherger.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//

class Scherger: Gegner {
    
    func heilPfeil(zuHeilen: Endgegner) {
        print("Scherger setzt Heil Pfeil ein")
        print("\(zuHeilen.name) bekommt 10 hp dazu!!")
        zuHeilen.hp = zuHeilen.hp + 10
        
        
    }
    func eisPfeil() {
        
    }
    func paralysePfeil() {
        
    }
    func giftPfeil() {
        
    }
}
