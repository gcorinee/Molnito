//
//  GroupModel.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import Foundation

struct GroupModel : Codable{
    var Name, MasterToken, startDate, endDate : String;
    var HowLong, MaxMember, CurrentMember, Token : Int;
}
