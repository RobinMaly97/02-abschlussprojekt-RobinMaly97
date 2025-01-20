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
        print("Der Barbar \(self.name) führt die Attacke Seismisches Schmettern gegen \(gegner.name) aus.")
        gegner.hp = gegner.hp - 10
    }
    
    // MARK: Reguläre Attacke
    func kraftvollerAnsturm(gegner: Gegner) {
        print("Der Barbar \(self.name) führt die Attacke Kraftvoller Ansturm gegen \(gegner.name) aus.")
        gegner.hp = gegner.hp - 15
    }
    // MARK: Block Attacke
    func schwertBlock(gegner: Gegner) {
        print("Der Barbar \(self.name) blockt die nächste Attacke.")
    }
    // MARK: Flächenangriff
    // da es ein flächenangriff ist muss als Parameter ein Array(Liste aus Gegner) übergeben werden damit ich auch bei allen gegnern die HP abziehen kann.
    func erdbeben(gegner: [Gegner]) {
        print("Der Barbar \(self.name) führt die Attacke Erdbeben aus.")
        print("Alle gegner werden getroffen.")
        for enemy in gegner {
            enemy.hp = enemy.hp - 10
        }
    }
    
    // MARK: Beutel
    func beutel() {
        print("Beutel")
        
    }

}
