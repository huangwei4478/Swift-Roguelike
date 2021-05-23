//
//  Map.swift
//  Swift-RogueLike
//
//  Created by huangwei on 2021/5/23.
//

import Foundation

struct Tile {
    
    /// The use of value type for Tile type
    /// an array of Tile
    /// just to separate the concern
    
    var blocked: Bool                  // true = the character cannot traverse the tile
    
    var blockSight: Bool               // true = the character cannot see what's beyond the tile
    
    init(_ blocked: Bool, _ blockSight: Bool) {
        self.blocked = blocked
        self.blockSight = blockSight
    }
}

class GameMap {
    let mapWidth: Int32
    
    let mapHeight: Int32
    
    var tiles = [[Tile]]()
    
    init(width: Int32, height: Int32) {
        self.mapWidth = width
        self.mapHeight = height
        self.tiles = self.makeTiles()
        self.blockAFew()
    }
    
    func isBlockedAt(x: Int32, y: Int32) -> Bool {
        return self.tiles[Int(x)][Int(y)].blocked
    }
    
    private func blockAFew() {
        
    }
    
    private func makeTiles() -> [[Tile]] {
        tiles = Array(repeating: Array(repeating: Tile(false, false), count: Int(mapHeight)),
                      count: Int(mapWidth))
        tiles[22][19].blocked = true
        tiles[22][19].blockSight = true
        tiles[23][19].blocked = true
        tiles[23][19].blockSight = true
        return tiles
    }
}

