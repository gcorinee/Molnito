//
//  User_List.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/18.
//

import SwiftUI

struct User_List: View {
    var body: some View {
        List {
            ForEach(0...3, id:\.self){num in
                Group_detail()
            }
            
        }.listStyle(PlainListStyle())
    }
}

struct User_List_Previews: PreviewProvider {
    static var previews: some View {
        User_List()
    }
}
