//
//  UserViewModel.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/17.
//

import Foundation

class UserViewModel : ObservableObject{
    @Published var userModel = UserModel(name: "", token: "", user_id: "", nickname: "", user_pwd: "")
    
    func setName(_ name: String){
        userModel.name = name
    }
    
    func setToken(_ token: String){
        userModel.token = token
    }
    
    func setUser_id(_ user_id: String){
        userModel.user_id = user_id
    }
    
    func setNickname(_ nickname: String){
        userModel.nickname = nickname
    }
    
    func setUser_pwd(_ user_pwd: String){
        userModel.user_pwd = user_pwd
    }
}
