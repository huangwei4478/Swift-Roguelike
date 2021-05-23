//
//  Entity.swift
//  Swift-RogueLike
//
//  Created by huangwei on 2021/5/23.
//

import Foundation

/// A building block for populating our map with objects and characters
class Entity {
    var px: Int32
    var py: Int32
    let symbol: String
    let color: TCOD_color_t
    
    init(x: Int32, y: Int32, char: String, color: TCOD_color_t) {
        self.px = x
        self.py = y
        self.symbol = char
        self.color = color
    }
    
    func move(x: Int32, y: Int32) {
        self.px = x
        self.py = y
    }
    
    
}
