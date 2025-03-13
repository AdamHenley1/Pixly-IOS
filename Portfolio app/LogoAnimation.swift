//
//  LogoAnimation.swift
//  Portfolio app
//
//  Created by Adam Mason on 22/01/2025.
//

import SwiftUI
enum AnimationPhase: CaseIterable {
    case start, middle, end
    
    var offset: CGFloat {
        switch self {
        case .start: 0
        case .middle: -10
        case .end: 0
        }
    }
}
struct LogoAnimationblack: View {
    @State private var arcAngle3: Double = 0
    @State private var arcAngle4: Double = 320
    @State var degreesRotating: Double = 1.0
    @State var expanding: Double = 0.0
    var body: some View {
        ZStack{// background colour
            Rectangle()
                .scale(x:expanding,y: 0.2)
                .rotationEffect(.degrees(46))
                .foregroundColor(.black)
                .offset(x:1,y:1)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.1)
                        .speed(0.7).delay(0.5))
                    {
                       expanding = 0.08
                    }
                }
            Circle()
                .trim(from: degreesRotating, to: 1)
                .rotation(.degrees(140))
                .stroke(Color.black ,style: StrokeStyle(lineWidth: 10))
                .frame(width: 30, height: 30)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.4)
                        .speed(0.7).delay(0.68)) {
                            degreesRotating = 0.23
                    }
                    
               }
               .offset(x:21.9,y:1)
            Circle()
               .trim(from: degreesRotating, to: 1.0)
               .rotation(.degrees(320))
               .stroke(Color.black ,style: StrokeStyle(lineWidth: 10))
               .frame(width: 30, height: 30)
               .offset(x:-20.9,y:0)
        }
        //the view height and width
        .frame(height: 50)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}

struct LogoAnimationwhite: View {
    @State private var arcAngle3: Double = 0
    @State private var arcAngle4: Double = 320
    @State var degreesRotating: Double = 1.0
    @State var expanding: Double = 0.0
    var body: some View {
        ZStack{// background colour
            Rectangle()
                .scale(x:expanding,y: 0.2)
                .rotationEffect(.degrees(46))
                .foregroundColor(Color(.white))
                .offset(x:1,y:1)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.1)
                        .speed(0.7).delay(0.3)) {
                            expanding = 0.08
                    }
               }
            Circle()
                .trim(from: degreesRotating, to: 1)
                .rotation(.degrees(140))
                .stroke(Color.white ,style: StrokeStyle(lineWidth: 10))
                .frame(width: 30, height: 30)
                .onAppear {
                    withAnimation(.easeOut(duration: 0.4)
                        .speed(0.7).delay(0.48)) {
                            degreesRotating = 0.23
                    }
               }
               .offset(x:21.9,y:1)
            Circle()
               .trim(from: degreesRotating, to: 1.0)
               .rotation(.degrees(320))
               .stroke(Color.white ,style: StrokeStyle(lineWidth: 10))
               .frame(width: 30, height: 30)
               .offset(x:-20.9,y:0)
        }
        //the view height and width
        .frame(height: 50)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
    }
}
// so that i can preview what this will look like
#Preview {
    LogoAnimationblack()
}

