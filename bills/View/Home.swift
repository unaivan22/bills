//
//  Home.swift
//  bills
//
//  Created by una ivan on 03/08/23.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView{
            List {
                Section(header: TopContent()) {
                   // ... your list content
                    ForEach(0..<14) { row in
                        NavigationLink(destination:About()) {
                            HStack(spacing:10){
                                Image(systemName: "questionmark.circle")
                                    .frame(width:56, height:56)
                                    .cornerRadius(10)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 24))
                                VStack(alignment: .leading){
                                    Text("Get help")
                                    Text("Indihome")
                                        .font(.system(size: 12))
                                }
                            }
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                        }
                    }.listRowBackground(
                    Capsule()
                        .fill(Color.white)
                        .padding(4)
                    )
                }
            }.listStyle(.insetGrouped)
            .navigationTitle("Tagihan")
        }
    }
}



struct TopContent: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        VStack{
            Text("Rp \(1.000)")
                .font(.system(size: 42))
                .foregroundColor(Color.black)
            
            VStack{
                HStack{
                    Text("Februari 2023")
                        .font(.system(size: 14))
                    Text("Februari 2023")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 14))
                }
                
                ProgressBar(value: $progressValue).frame(height: 20)
                            
                            Button(action: {
                                self.startProgressBar()
                            }) {
                                Text("Start Progress")
                            }.padding()
                            
                            Button(action: {
                                self.resetProgressBar()
                            }) {
                                Text("Reset")
                            }
                
            }
            .background(Color.white)
            .padding(6)
        }
    }
    
    func startProgressBar() {
            for _ in 0...80 {
                self.progressValue += 0.015
            }
        }
        
        func resetProgressBar() {
            self.progressValue = 0.0
        }
}


struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}
