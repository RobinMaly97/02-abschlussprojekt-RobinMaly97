//
//  Protocols.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 6. Protokolle implementieren



protocol CustomStringConvertable {
    var description: String { get }

}


protocol Nutzbar {
    var name: String { get }
    var schadensWert: Double { get }
    var verteidigungsWert: Double { get }
    var anzahlVerwendung: Int { get }
    
    func anwenden()
}
