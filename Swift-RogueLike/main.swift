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

var playerx: Int32 = width / 2
var playery: Int32 = height / 2
tcod.putChar(x: playerx, y: playery, char: "@")
tcod.flush()

while (tcod.windowisClosed() == false) {
    guard tcod.chkKeypress() else { continue }
    
    switch (tcod.key.vk) {
    case TCODK_UP:
        playery -= 1
    case TCODK_DOWN:
        playery += 1
    case TCODK_LEFT:
        playerx -= 1
    case TCODK_RIGHT:
        playerx += 1
    default:
        continue
    }
    
    tcod.consoleClear()
    tcod.putChar(x: playerx, y: playery, char: "@")
    tcod.flush()
}

