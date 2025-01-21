//
//  Extensions.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 8. Extensions anlegen



extension String {
    func hashTags() -> String {
        return "###" + self + "###"
    }
    
    func einruecken() -> String {
        return "    " + self
    }
    
    func angriff() -> String {
        return "⚔️ " + self
    }
    
    func verteidigung() -> String {
        return "🛡️ " + self
    }
}

extension Double {
    
    var zweiStellenNachKomma: Double {
        get {
            return Double(String(format: "%.2f", self))!
        }
    }
}




