//
//  CircleGroupView.swift
//  Restart-App
//
//  Created by Kul Boonanake on 27/4/23.
//

import SwiftUI

struct CircleGroupView: View {
    //MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimateing: Bool = false
    
    //MARK: - Body
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260,  height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center )
        }//: ZSTACK
        .blur(radius: isAnimateing ? 0 : 10)
        .opacity(isAnimateing ? 1 : 0)
        .scaleEffect(isAnimateing ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimateing)
        .onAppear {
            isAnimateing = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Colo rBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
