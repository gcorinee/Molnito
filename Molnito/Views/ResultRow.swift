//
//  ResultRow.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

import SwiftUI

struct ResultRow: View {
    var result : Result
    
    var body: some View {
        
        HStack {
            HStack(){
                Text(result.name)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.leading)
                    .padding(.trailing)
                
            }
            .frame(alignment: .center)
            .background(Color("hanyangOrange"))
            .modifier(CardModifier())
            .padding(.all, 10)
            .padding(.leading, -10)
            
            Spacer()
                .frame(width: 20)
            
            Image(systemName: "arrow.right")
                .font(.system(size: 30, weight: .bold, design: .rounded))
            
            Spacer()
                .frame(width: 20)
            
            HStack(){
                Text(result.manitee)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.leading)
                    .padding(.trailing)
                
            }
            .frame(alignment: .center)
            .background(Color("hanyangBlue")).opacity(0.9)
            .modifier(CardModifier())
            .padding(.all, 10)
            .padding(.trailing, -10)
            
        }
        .frame(height: 100, alignment: .center)
    }
    
}

struct ResultRow_Previews: PreviewProvider {
    static var results = ResultModelData().results
    
    static var previews: some View {
        Group {
            ResultRow(result: results[0])
            ResultRow(result: results[1])
            
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}

