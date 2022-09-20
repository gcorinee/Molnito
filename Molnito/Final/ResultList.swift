//
//  ResultList.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct ResultList: View {
    var results = ResultModelData().results
    
    var body: some View {
        
        NavigationView {
            List(results) { result in
                ResultRow(result: result)
//                    .frame(width: 380, height: 100, alignment: .center)
            }
            .navigationTitle("결과 화면")
        }
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList()
    }
}
