//
//  Charakter.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung



class Charakter {
    
    let name: String
    var hp: Double
    
    init(name: String, hp: Double) {
        self.name = name
        self.hp = hp
    }
    
    func nimmSchaden(_ schaden: Double) {
        self.hp = self.hp - schaden
        
        if self.hp <= 0 {
            print("Der Gegner ist besiegt")
        }
    }
    
    func heilung(_ heilen: Double) {
        self.hp = self.hp + heilen
    }
}
