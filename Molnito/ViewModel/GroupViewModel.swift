//
//  GroupViewModel.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import Foundation

class GroupViewModel : ObservableObject{
    @Published var group = GroupModel(Name: "", MasterToken: "", startDate: "", endDate: "", HowLong: 0, MaxMember: 0, CurrentMember: 0, Token: 0)
    
    func setName(_ text: String){
        group.Name = text
    }
    func setMasterToken(_ text: String){
        group.MasterToken = text
    }
    func setStartDate(_ text: String){
        group.startDate = text
    }
    func setEndDate(_ text: String){
        group.endDate = text
    }
    func setHowLong(_ text: Int){
        group.HowLong = text
    }
    
    func setMaxMember(_ text: Int){
        group.MaxMember = text
    }
    
    func plusCurrentMember(){
        group.CurrentMember = group.CurrentMember+1
    }
    
    func setToken(){
        group.Token = Int.random(in: 1..<100000)
    }
    func putinToken(_ token:Int){
        group.Token = token
    }
}
