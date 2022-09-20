//
//  GroupMemberList.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct GroupMemberList: View {
    
    //@EnvironmentObject var modeldata: ModelData
//    var groupMembers = GroupModelData().groupMembers
    @Binding var namelist : [String]
    var body: some View {
        
        NavigationView {
//            List(groupMembers) { groupMember in
//                GroupMemberRow(groupMember: groupMember)
//            }
            List {
                ForEach($namelist, id: \.self){ temp in
                    GroupMemberRow(groupMember: temp)
                }
            }
            .navigationTitle("Group Member")
        }
//        VStack{
//            List{
//                Section(header: Text("Header")){
//                    ForEach()
//                }
//            }
//        }
        
        /*
         List(groupMembers, id: \.id) { groupMember in
             GroupMemberRow(groupMember: groupMember)
         }
         */
    }
}

//struct GroupMemberList_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupMemberList()
//    }
//}
