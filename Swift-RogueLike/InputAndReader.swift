//
//  InputAndReader.swift
//  Swift-RogueLike
//
//  Created by huangwei on 2021/5/23.
//

import Foundation

func keyReader() -> [String: (Int32, Int32)] {
    switch (tcod.key.vk) {
    case TCODK_UP:
        return ["move": (0, -1)]
    case TCODK_DOWN:
        return ["move": (0, 1)]
    case TCODK_LEFT:
        return ["move": (-1, 0)]
    case TCODK_RIGHT:
        return ["move": (1, 0)]
    case TCODK_ESCAPE:
        return ["exit": (0, 0)]
    default:
        return ["unknown": (0, 0)]
    }
}

// Declare some additional default colors that will be used in drawing map.
let dark_wall = TCOD_color_RGB(0, 0, 100)
let dark_ground = TCOD_color_RGB(50, 50, 150)

func drawAll(ents: [Entity]) {
    for y in 0 ..< gameMap.mapHeight {
        for x in 0 ..< gameMap.mapWidth {
            let wall = gameMap.tiles[Int(x)][Int(y)].blockSight
            if wall == true {
                tcod.setCharBG(x: x, y: y, col: dark_wall)
            } else {
                tcod.setCharBG(x: x, y: y, col: dark_ground)
            }
        }
    }
    
    for ent in ents {
        drawEnt(ent: ent)
    }
    
    tcod.blit(xScr: 0, yScr: 0, wScr: width, hScr: height, xDst: 0, yDst: 0, fgalpha: 0.0, bgalpha: 0.0)
}

func clearAllEnts(ents: [Entity]) {
    for ent in ents {
        clearEnt(ent: ent)
    }
}

func drawEnt(ent: Entity) {
    tcod.putColorChar(x: ent.px, y: ent.py, char: ent.symbol, color: ent.color)
}

func clearEnt(ent: Entity) {
    // for the sake of continuity with the python tutorial
    // tcod.consoleClear() will do the same thing
    tcod.putChar(x: ent.px, y: ent.py, char: " ")
}
