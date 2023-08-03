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
                        Image(systemName: "square.text.square.fill")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Home")
                    }.tag(0)
                
                Profile()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Chart")
                    }.tag(1)
                
                Profile()
                    .tabItem {
                        Image(systemName: "person.fill")
                            .renderingMode(.template)
                            .environment(\.symbolVariants, .none)
                        Text("Profile")
                    }.tag(2)
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
