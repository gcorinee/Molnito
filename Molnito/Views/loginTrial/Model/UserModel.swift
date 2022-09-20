//
//  UserModel.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/17.
//

import Foundation

struct UserModel : Codable{
    var name, token, user_id, nickname, user_pwd: String
}
struct result : Codable{
    var user_name, nickname, token : String
    var isValid : Bool
}

