//
//  UserInfoViewModel.swift
//  Molnito
//
//  Created by 박강우 on 2022/07/19.
//

import Foundation

class UserViewModel : ObservableObject{
    @Published var user = userInfo(name: "", token: "", user_id: "", nickname: "", user_pwd: "")
    
    func setName(_ name: String){
        user.name = name
    }
    func setToken(_ token : String){
        user.token = token
    }
    func setNickName(_ nick : String){
        user.nickname = nick
    }
    func setUserID(_ user_id : String){
        user.user_id = user_id
    }
    func setUserPwd(_ user_pwd : String){
        user.user_pwd = user_pwd
    }
    
}
