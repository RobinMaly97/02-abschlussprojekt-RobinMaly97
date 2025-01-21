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
\tTränke: \(trank)
\tPara Heiler: \(paraHeiler)
\tFeuer Heiler: \(feuerHeiler)
\tGift Heiler: \(giftHeiler)
\tEis Heiler:  \(eisHeiler)
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
        Waffe(name: "Schwert", schadensMultiplier: 1.5, verteidigungsWert: 10, anzahlVerwendung: 3),
        Waffe(name: "Schild", schadensMultiplier: 1, verteidigungsWert: 10, anzahlVerwendung: 3),
        Waffe(name: "Eiserne Faust", schadensMultiplier: 1.6, verteidigungsWert: 0, anzahlVerwendung: 3),
        Waffe(name: "Geweite Axt", schadensMultiplier: 1.8, verteidigungsWert: 0, anzahlVerwendung: 3)
    ]
    var items: [Item] = [
        Item(name: "Feuer Rune", schadensWert: 10, verteidigungsWert: 5, anzahlVerwendung: 3),
        Item(name: "Eis Rune", schadensWert: 12, verteidigungsWert: 8, anzahlVerwendung: 3),
        Item(name: "Gift Rune", schadensWert: 15, verteidigungsWert: 4, anzahlVerwendung: 3),
        Item(name: "Paralyse Rune", schadensWert: 11.5, verteidigungsWert: 6.5, anzahlVerwendung: 3)
    ]
    
    
    func beutelInhalt() {
        var inhalt: [Beutel] = [Beutel()]
        for (index,item) in inhalt.enumerated() {
            print("\(index + 1). \(item.waffen[0])")
            print("\(index + 2). \(item.items[0])")
            
        }
    }
}


