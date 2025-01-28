//
//  Charakter.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 4. Klassen & Vererbung

import Foundation
import AVFoundation

class Charakter {
    
    let name: String
    var hp: Double

    
    init(name: String, hp: Double) {
        self.name = name
        self.hp = hp
    }
    
    
    
    func heilung(_ heilen: Double) {
        self.hp = self.hp + heilen
        print("\(self.name) bekommt \(heilen) Hp dazu.")
    }
    
    func playSound(path: String) {
        // erstellt ein URL-Objekt aus dem dateipfad:
        let url = URL(fileURLWithPath: path)
        // versuch, den sound abzuspielen
        do {
        // audioplayer mit dem angegebenen URL-Objekt erstellen:
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            // startet die wiedergabe des sounds
            audioPlayer?.play()
        }
        // falls ein fehler auftritt, wird dieser im catch-block abgefangen und eine meldung ausgegeben
        catch {
            print("Fehler beim Abspielen des Sounds: \(error) --\(error.localizedDescription)")
        }
    }
}
