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
    
    func nimmSchade(_ schaden: Double) {
        self.hp = self.hp - schaden
    }
    
    func heilung(_ heilen: Double) {
        self.hp = self.hp + heilen
    }
}
