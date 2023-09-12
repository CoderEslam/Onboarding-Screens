//
//  ContentView.swift
//  Onboarding Screens
//
//  Created by Eslam Ghazy on 4/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSview : Bool = false
    @State var showTview : Bool = false
    @State var showFview : Bool = false
    var body: some View {
        ZStack{
            Text("Swiftui Onboarding").bold().font(.largeTitle)
                .offset(y:-100)
                .padding(.leading,8)
            FiristView(showNextView: $showSview)
            SecondView(showNextView: $showTview)
                .modifier(ViewAnimation(isShow: showSview))
            HomeView(showNextView: $showTview)
                .modifier(ViewAnimation(isShow: showTview))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ViewAnimation :ViewModifier {
    var isShow:Bool
     
    func body(content: Content) -> some View {
        content.offset(x: isShow ? 0 : 200)
            .scaleEffect(isShow ? 1:0,anchor: .bottomTrailing)
            .animation(.spring(), value: isShow)
    }
}





