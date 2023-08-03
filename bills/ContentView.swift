//
//  ContentView.swift
//  bills
//
//  Created by una ivan on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        VStack{
            TabView(selection: $selectedTab) {
                Home()
                    .tabItem {
                        Image("home")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Home")
                    }.tag(0)
                
                Profile()
                    .tabItem {
                        Image("profile")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Profile")
                    }.tag(2)
            }
            .accentColor(.black)
        }.background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
