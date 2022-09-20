//
//  MissionDetail.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct MissionDetail: View {
    @EnvironmentObject var missionMd: MissionModelData
    var mission : Mission
    
    var missionIdx: Int{
        // input 과 modelData 와 비교했을 때의 index 계산
        missionMd.missions.firstIndex(where: { $0.id == mission.id})!
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Image(mission.imageName)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            
            HStack{
                VStack(alignment: .leading){
                    
                    Text(mission.title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                }
                .layoutPriority(100)
                
                Spacer()
                
                CheckButton(isSet: $missionMd.missions[missionIdx].check)
                
            }
            .padding()
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct MissionDetail_Previews: PreviewProvider {
    static var missionMd = MissionModelData()
    
    static var previews: some View {
        MissionDetail(mission: MissionModelData().missions[0])
            .environmentObject(missionMd)
    }
}
