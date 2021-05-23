//
//  main.swift
//  Swift-RogueLike
//
//  Created by huangwei on 2021/5/21.
//

import Foundation

let tcod = TCOD()
let title: String = "Swift Rogue Like Tutorial"
let width: Int32 = 80
let height: Int32 = 40

tcod.initRoot(w: width, h: height, title: title)
tcod.consoleClear()

let gameMap = GameMap(width: width, height: height)
let player = Entity(x: width / 2, y: height / 2, char: "@", color: stcodFuscia)
let npc = Entity(x: width / 2 - 5, y: height / 2 - 1, char: "N", color: stcodBlue)
var ents = [player, npc]

var retVal = [String: (Int32, Int32)]()
var (chgx, chgy) = (Int32(0), Int32(0))

while (tcod.windowisClosed() == false) {
    guard tcod.chkKeypress() else { continue }
    retVal = keyReader()
    for key in retVal.keys {
        if key == "move" {
            (chgx, chgy) = retVal["move"] ?? (0, 0)
            if !gameMap.isBlockedAt(x: player.px + chgx, y: player.py + chgy) {
                player.move(x: chgx, y: chgy)
            }
        }
        if key == "exit" {
            tcod.quit()
            exit(0)
        }
    }
    
    tcod.consoleClear()
    drawAll(ents: ents)
    tcod.flush()
    clearAllEnts(ents: ents)
}

