//
//  Loginbackground.swift
//  Portfolio app
//
//  Created by Adam Mason on 23/01/2025.
//

//
//  LogoAnimation.swift
//  Portfolio app
//
//  Created by Adam Mason on 22/01/2025.
//

import SwiftUI

struct LoginBackground: View {
    
    var body: some View {
        ZStack{
            Color(red: 0.23, green: 0.21, blue: 0.59)
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(Color(red: 0.46, green: 0.35, blue: 1.08).opacity(0.75))
            Circle()
                .scale(1.35)
                .foregroundColor(Color(red:0.67,green: 0.61,blue: 1.39))
        }
    }
}

#Preview {
    LoginBackground()
}

