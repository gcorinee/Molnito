//
//  GroupModel.swift
//  makeGroup
//
//  Created by 박강우 on 2022/07/18.
//

import Foundation

struct GroupModel : Codable{
    var Name, MasterToken, startDate, endDate : String;
    var HowLong, MaxMember, CurrentMember, Token : Int;
}

