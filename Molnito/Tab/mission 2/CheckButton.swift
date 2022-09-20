//
//  CheckButton.swift
//  Molnito
//
//  Created by 예은 on 2022/07/19.
//

import SwiftUI

struct CheckButton: View {
    @Binding var isSet : Bool
    var body: some View {
        Button{
            isSet.toggle() // "isSet" 상태를 토글하는 action 부여
        } label: {
            // isSet이 true면 check, false 면 empty circle
            Label("Mission Toggle", systemImage: isSet ? "checkmark.circle.fill" : "circle")
                .labelStyle(.iconOnly)
                //.foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(isSet: .constant(true))
    }
}
