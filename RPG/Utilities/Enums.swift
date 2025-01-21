//
//  Enums.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 7. Enums verwenden

enum Status: String {
    case gesund = "Gesund"
    case verwundet = "Verwundet"
    case brennt = "Brennt"
    case vereist = "Vereist"
    case vergiftet = "Vergiftet"
    case paralysiert = "Paralysiert"
    
}


enum SpielZustand: String {
    case vorbereitung = "Vorbereitung"
    case kampf = "Kampf"
    case spielVorbei = "Spiel vorbei"
}
