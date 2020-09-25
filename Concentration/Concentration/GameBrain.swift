//
//  GameBrain.swift
//  Concentration
//
//  Created by Tarek Hany on 9/23/20.
//  Copyright © 2020 Tarek Hany. All rights reserved.
//

import Foundation

struct GameBrain {
    var picsArray = ["🎾","🎲","🎸","🚗","✈️","⚓️","🏠","💻","⏱","💡","💸","💎","🎾","🎲","🎸","🚗","✈️","⚓️","🏠","💻","⏱","💡","💸","💎"]
    mutating func shuffle() {
        picsArray.shuffle()
    }
}
