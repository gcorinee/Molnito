//
//  Structures.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/18.
//

import Foundation

struct GroupModel : Codable{
    var Name, MasterToken, startDate, endDate : String;
    var HowLong, MaxMember, CurrentMember, Token : Int;
}

//---------------------------

struct userInfo : Codable{
    var name,token, user_id, nickname, user_pwd : String;
}



//=----------------------------
