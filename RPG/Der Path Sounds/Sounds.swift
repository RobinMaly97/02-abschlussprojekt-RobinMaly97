//
//  Sounds.swift
//  RPG
//
//  Created by Robin Maly on 28.01.25.
//
import Foundation
import AVFoundation


let explosionsSound: String = "/Users/robinmaly/Desktop/Sounds/explosion.wav"
let dreiKoepfigeHydra: String = "/Users/robinmaly/Desktop/Sounds/3 Köpfige Hydra.aiff"
let erdbeben: String = "/Users/robinmaly/Desktop/Sounds/Erdbeben.wav"
let flammenInferno: String = "/Users/robinmaly/Desktop/Sounds/Flammen Inferno.wav"
let frostStrahl: String = "/Users/robinmaly/Desktop/Sounds/Frost Strahl.wav"
let geisterSpeerFeuer: String = "/Users/robinmaly/Desktop/Sounds/Geister Speerfeuer 2s..wav"
let gesegneterHammer: String = "/Users/robinmaly/Desktop/Sounds/Gesegneter Hammer.wav"
let giftPfeil: String = "/Users/robinmaly/Desktop/Sounds/Gift Pfeil.ogg"
let heilen: String = "/Users/robinmaly/Desktop/Sounds/Heilen.mp3"
let himmelsFaust: String = "/Users/robinmaly/Desktop/Sounds/Himmelsfaust.ogg"
let kraftvollerAnsturn: String = "/Users/robinmaly/Desktop/Sounds/Kraftvoller Ansturn.mp3"
let meteorSchlag: String = "/Users/robinmaly/Desktop/Sounds/Meteor Schlag.wav"
let paralyseBombe: String = "/Users/robinmaly/Desktop/Sounds/Paralyse Bombe 1,5s.wav"
let schergenBeschwören: String = "/Users/robinmaly/Desktop/Sounds/Schergen Beschwören.wav"
let schildBlock: String = "/Users/robinmaly/Desktop/Sounds/Schild Block.wav"
let schwertBlock: String = "/Users/robinmaly/Desktop/Sounds/Schwert Block.wav"
let schwungAngriff: String = "/Users/robinmaly/Desktop/Sounds/Schwung Angriff.wav"
let seelenErnte: String = "/Users/robinmaly/Desktop/Sounds/Seelen Ernte.wav"
let seismischesSchmettern: String = "/Users/robinmaly/Desktop/Sounds/seismisches Schmettern.wav"
let zornDesTeufels: String = "/Users/robinmaly/Desktop/Sounds/Zorn des Teufels.wav"

var audioPlayer: AVAudioPlayer?


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
