//
//  SideMenuViewModel.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/16.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case logout
    case developers
    
    var title: String{
        switch self{
        case .profile: return "Profile"
        case .logout: return "Log Out"
        case .developers: return "Developers"
        }
    }
    
    var image: String{
        switch self{
        case .profile: return "person.crop.circle"
        case .logout: return "arrow.left.square"
        case .developers: return "wrench.and.screwdriver"
        }
    }
}
