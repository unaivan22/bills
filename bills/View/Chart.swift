//
//  Chart.swift
//  bills
//
//  Created by una ivan on 04/08/23.
//

import SwiftUI

struct Chart: View {
    init() {
            //Use this if NavigationBarTitle is with Large Font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.systemFont(ofSize: 14, weight: .medium)]

        }
    
    var body: some View {
        NavigationView{
            List(){
                
                Section(header: Text("Rincian Tagihan")) {
                    // ... your list content
                    ForEach(0..<2) { row in
                        NavigationLink(destination:About()) {
                            HStack(spacing:12){
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
                
                Section(header: Text("Rincian Tagihan")) {
                    // ... your list content
                    ForEach(0..<2) { row in
                        NavigationLink(destination:About()) {
                            HStack(spacing:12){
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
                                        Image(systemName: "hourglass")
                                            .foregroundColor(Color.yellow)
                                            .font(.system(size: 14))
                                        Text("Progress")
                                            .font(.system(size: 14))
                                            .foregroundColor(Color.yellow)
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
                
                Section(header: Text("Rincian Tagihan")) {
                    // ... your list content
                    ForEach(0..<2) { row in
                        NavigationLink(destination:About()) {
                            HStack(spacing:12){
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
                                        Button("Bayar") {

                                        }.buttonStyle(.bordered)
                                            .cornerRadius(12)
                                    }
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
