//
//  Image_Main.swift
//  Molnito
//
//  Created by 허회준 on 2022/07/15.
//

import SwiftUI

struct Image_Main: View {
    var body: some View {
        Image("morip")
            .resizable()
            .frame(width: 300, height: 300)
    }
}

struct Image_Main_Previews: PreviewProvider {
    static var previews: some View {
        Image_Main()
    }
}
