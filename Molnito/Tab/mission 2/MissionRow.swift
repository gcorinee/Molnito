//
//  MissionRow.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct MissionRow: View {
    var mission : Mission
    
    var body: some View {
        HStack{
            mission.image
                .resizable()
                .frame(width:50, height: 50)
                .padding()
            
            
            Text(mission.title)
                .padding()
            
            Spacer()
            
            if mission.check{
                Image(systemName: "checkmark.circle.fill")
                    .padding()
            }
            else{
                Image(systemName: "circle")
                    .padding()
            }
            
        }
    }
}
//    private let task: Snapshot<Model.Task>
//    private let onTapCompleted: () -> Void
//    @State var opacity: Double = 0.0
//    init(task: Snapshot<Model.Task>, onTapCompleted: @escaping () -> Void) {
//        self.task = task
//        self.onTapCompleted = onTapCompleted
//    }
//
//    var body: some View {
//        VStack {
//            HStack(spacing: 16.0) {
//                VStack(alignment: .leading, spacing: 4.0) {
//                    Text(task.data.title)
//                        .font(.headline)
//                        .lineLimit(1)
//
//                    Text(task.data.desc)
//                        .lineLimit(3)
//                        .fixedSize(horizontal: false, vertical: true)
//                }
//                .layoutPriority(1)
//
//                Spacer()
//
//                Image(systemName: task.data.completed ? "checkmark.circle.fill" : "circle")
//                    .imageScale(.large)
//                    .onTapGesture(perform: onTapCompleted)
//            }
//        }
//        .padding()
//        .background(task.data.taskColor.color)
//        .cornerRadius(16.0)
//        .padding([.horizontal], 16.0)
//        .padding([.bottom], 8.0)
//        .opacity(opacity)
//        .onAppear {
//            withAnimation {
//                self.opacity = 1.0
//            }
//        }
//    }


struct MissionRow_Previews: PreviewProvider {
    static var missions = MissionModelData().missions
    
    static var previews: some View {
       Group {
           MissionRow(mission: missions[0])
           MissionRow(mission: missions[4])
       }
       .previewLayout(.fixed(width: 300, height: 70))
    }
}
