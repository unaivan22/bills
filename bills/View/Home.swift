//
//  Home.swift
//  bills
//
//  Created by una ivan on 03/08/23.
//

import SwiftUI

struct Home: View {
    init() {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 14, weight: .medium)]

        }
    
    var body: some View {
        NavigationView{
            List(){
                Section(){
                    HStack{
                        TopContent()
                        
                        
                    }
                }
                .listRowBackground(Color.clear)
                .padding(.top, -15)
                .padding(.bottom, -18)
                
                Section(header: Text("Rincian Tagihan")) {
                    // ... your list content
                    ForEach(0..<8) { row in
                        NavigationLink(destination:About()) {
                            HStack(spacing:12){
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 24))
                                VStack(alignment: .leading, spacing: 2){
                                    Text("Rp \(1000000)")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                    Text("Indihome")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                VStack(alignment: .center, spacing: 2){
                                    HStack(spacing: 2){
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(Color.green)
                                            .font(.system(size: 14))
                                        Text("Lunas")
                                            .font(.system(size: 14))
                                            .foregroundColor(Color.green)
                                    }
                                    Text("Dibayar tgl 10")
                                        .font(.system(size: 11))
                                        .foregroundColor(Color.gray)
                                }

                            }
                            .padding(.top, 6)
                            .padding(.bottom, 6)
                        }.listRowSeparator(.hidden)
                    }
                    .listRowBackground(
                        Rectangle()
                            .fill(Color.white)
                            .padding(4)
                            .cornerRadius(28)
                    )
                }
                
            }
            .listStyle(.insetGrouped)
            . listRowSeparator(. hidden)
            .navigationBarTitle(Text("Tagihan").font(.subheadline), displayMode: .large)
        }
    }
}


struct TopContent: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Rp \(1000000)")
                .font(.system(size: 42))
                .foregroundColor(Color.black)
                .fontWeight(.bold)
                .padding(.leading, 20)
                .frame(width: .infinity)
            
            VStack(spacing: 0){
                HStack{
                    Text("Februari 2023")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                    
                    Spacer()
                    
                    Text("Bayar Semua")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }.frame(width: UIScreen.main.bounds.width - 60)
                
                ProgressBar()
                
                HStack{
                    HStack(alignment: .top){
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(height: 12)
                        Text("Belum bayar")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 12))
                    }
                    HStack{
                        Circle()
                            .fill(Color.green)
                            .frame(height: 12)
                        Text("Lunas")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 12))
                    }
                    HStack{
                        Circle()
                            .fill(Color.yellow)
                            .frame(height: 12)
                        Text("Progres")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    
                }.padding(.leading, 16)
                
            }
            .frame(width: .infinity)
            .background(Color.clear)
            .padding(6)
        }
    }
}


struct ProgressBar: View {
    @State private var progress2: CGFloat = 0.5
    @State private var progress3: CGFloat = 0.4
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color(.systemGray4))
                    .frame(height: 10)
                    .cornerRadius(100)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: getWidth(for: progress2), height: 10)
                    .cornerRadius(100)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: getWidth(for: progress3), height: 10)
                    .cornerRadius(100)
            }
            .cornerRadius(10)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 20)
            
        }
        
        
    }
    
    
    private func getWidth(for progress: CGFloat) -> CGFloat {
        return progress * UIScreen.main.bounds.width
    }
}
