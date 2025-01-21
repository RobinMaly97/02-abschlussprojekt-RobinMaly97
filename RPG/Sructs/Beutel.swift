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
    
    var trank: Int
    var paraHeiler: Int
    var feuerHeiler: Int
    var giftHeiler: Int
    var eisHeiler: Int
    var waffen: [Waffe]
    var items: [Item]
}
