//
//  Songs.swift
//  Challenge14App
//
//  Created by Letícia Delmilio Soares on 18/05/26.
//

import SwiftUI

struct Songs: Identifiable{
    var name: String
    let id = UUID()
    let number: Int
    var isFavorite: Bool
    
}

let songs: [Songs] = [
    Songs(name: "Forever Outisider", number: 1, isFavorite: true),
    Songs(name: "Where August Moum", number: 2, isFavorite: true),
    Songs(name: "Billie Jean", number: 3, isFavorite: false),
    Songs(name: "Imagine", number: 4, isFavorite: false),
    
    ]
