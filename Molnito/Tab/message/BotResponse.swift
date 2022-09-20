//
//  BotResponse.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import Foundation

func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("안녕"){
        return "안녕!"
    } else if tempMessage.contains("뭐해"){
        return "누워있는중"
    } else if tempMessage.contains("잘가"){
        return "너두!"
    } else if tempMessage.contains("몰캠"){
        return "힘들다... "
    } else if tempMessage.contains(""){
        return "?"
    } else if tempMessage.contains("스위프트"){
        return "어렵당"
    } else if tempMessage.contains("야메추"){
        return "화끈이에 소주 ㄱ?"
    } else if tempMessage.contains("와"){
        return "와!"
    } else if tempMessage.contains("마니또 누구야"){
        return "비밀"
    } else if tempMessage.contains("몬말알"){
        return "몬말알~"
    } else {
        return "응?"
    }
}
 
