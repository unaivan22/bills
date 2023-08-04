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
                        Image("ic_wallet")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 12))
                        Text("Home")
                    }.tag(0)
                
                Chart()
                    .tabItem {
                        Image("ic_chart")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Chart")
                    }.tag(1)
                
                Profile()
                    .tabItem {
                        Image("ic_profile")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Profile")
                    }.tag(2)
                
                TestCode()
                    .tabItem {
                        Image("ic_profile")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Profile")
                    }.tag(3)
            }
            .accentColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
