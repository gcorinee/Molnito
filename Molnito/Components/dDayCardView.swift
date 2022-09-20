//
//  dDayCardView.swift
//  loginTrial
//
//  Created by 예은 on 2022/07/18.
//

import SwiftUI

// --------
// card modifier
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
    }
    
}

struct dDayCardView: View {
    //@State var leftDay : Int = 10
    
    var body: some View {
        
        let leftDay : Int = 10 /////////
        let leftStr = String(leftDay)
        
        HStack(alignment: .center) {
            
            VStack(alignment: .center) {
                Text("D - \(leftStr)")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("마니또 공개까지 \(leftStr) 일 남았습니다")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 5)
                    .padding(.bottom, 15)
//                HStack {
//                    Text("$" + String.init(format: "%0.2f", price))
//                        .font(.system(size: 16, weight: .bold, design: .default))
//                        .foregroundColor(.white)
//                        .padding(.top, 8) }
                
            }
            .padding()
           
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("hanyangBlue"))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct dDayCardView_Previews: PreviewProvider {
    static var previews: some View {
        dDayCardView()
    }
}
