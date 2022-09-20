//
//  MissionList.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct MissionList: View {
    
    @EnvironmentObject var missionMD : MissionModelData
    @State private var showCheckOnly = false
    
    var filteredResults: [Mission]{
        missionMD.missions.filter {
            mission in (!showCheckOnly || !mission.check)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showCheckOnly) {
                    Text("남은 할 일")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                ForEach(filteredResults) { mission in
                NavigationLink {
                    MissionDetail(mission: mission)
                } label : {
                    MissionRow(mission: mission)
                    }
                }

            }
            .navigationTitle("Mission")
        }
    }
}

struct MissionList_Previews: PreviewProvider {
    static var previews: some View {
        MissionList()
            .environmentObject(MissionModelData())
    }
}
