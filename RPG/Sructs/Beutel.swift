//
//  Beutel.swift
//  RPG
//
//  Created by Robin Maly on 20.01.25.
//
// MARK: 5. Structs implementieren
// MARK: 6. Protokolle implementieren



struct Beutel: CustomStringConvertable {
    var description: String {
        return """
\t[1] Tränke: \(trank)
\t[2] Para Heiler: \(paraHeiler)
\t[3] Feuer Heiler: \(feuerHeiler)
\t[4] Gift Heiler: \(giftHeiler)
\t[5] Eis Heiler:  \(eisHeiler)
\tWaffen: \(waffen)
\tItems: \(items)
"""
    }
    
    var trank: Int = 2
    var paraHeiler: Int = 2
    var feuerHeiler: Int = 2
    var giftHeiler: Int = 2
    var eisHeiler: Int = 2
    var waffen: [Waffe] = [
        Waffe(name: "Schwert", schadensWert: 10, verteidigungsWert: 10, anzahlVerwendung: 3),
        Waffe(name: "Schild", schadensWert: 0, verteidigungsWert: 10, anzahlVerwendung: 3),
        Waffe(name: "Eiserne Faust", schadensWert: 10, verteidigungsWert: 0, anzahlVerwendung: 3),
        Waffe(name: "Geweite Axt", schadensWert: 10, verteidigungsWert: 0, anzahlVerwendung: 3)
    ]
    var items: [Item] = [
        Item(name: "Feuer Rune", schadensWert: 10, verteidigungsWert: 5, anzahlVerwendung: 3),
        Item(name: "Eis Rune", schadensWert: 10, verteidigungsWert: 8, anzahlVerwendung: 3),
        Item(name: "Gift Rune", schadensWert: 10, verteidigungsWert: 4, anzahlVerwendung: 3),
        Item(name: "Paralyse Rune", schadensWert: 10, verteidigungsWert: 6.5, anzahlVerwendung: 3)
    ]
    
    
    func beutelInhalt() {
        var inhalt: [Beutel] = [Beutel()]
        for item in inhalt {
            print("\(item.waffen)")
           
            
        }
    }
}



