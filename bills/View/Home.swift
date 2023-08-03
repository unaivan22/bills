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
            Form {
                Section(){
                    NavigationLink(destination:About()) {
                        HStack{
                            //Profile photo
                            Image("faceuna")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .clipShape(Circle())
                            
                            //Nama dan Status
                            VStack(alignment:.leading){
                                Text("Unaivan").font(.headline)
                                Text("Interface Engineer").font(.caption)
                            }
                            
                            
                        }
                    }
                }
                .padding(.top,5)
                .padding(.bottom,5)
                
                Text("Rp 1.756.000,00")
                
                //navigation pesan berbintang
                Section(header: Text("Pengaturan Umum")){
                    NavigationLink(destination:About()) {
                        //Image Bintang
                        HStack(spacing:20){
                            Image(systemName: "star.fill")
                                .frame(width:35, height:35)
                                .background(Color.orange)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            //Text
                            Text("Pesan Berbintang")
                        }
                        .padding(.top,2)
                        .padding(.bottom,2)
                    }
                    //navigation whatsapp desktop
                    NavigationLink(destination:About()) {
                        //Image Bintang
                        HStack(spacing:20){
                            Image(systemName: "tv")
                                .frame(width:35, height:35)
                                .background(Color.green)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            //Text
                            Text("WhatsApp Web/Desktop")
                        }
                        .padding(.top,2)
                        .padding(.bottom,2)
                    }
                }
                
                //Akun
                Section(header: Text("Pengaturan Akun")){
                    //navigation pesan berbintang
                    NavigationLink(destination:About()) {
                        //Image Bintang
                        HStack(spacing:20){
                            Image(systemName: "person")
                                .frame(width:35, height:35)
                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            //Text
                            Text("Akun")
                        }
                        .padding(.top,2)
                        .padding(.bottom,2)
                    }
                    //navigation whatsapp desktop
                    NavigationLink(destination:About()) {
                        //Image Bintang
                        HStack(spacing:20){
                            Image(systemName: "phone.circle")
                                .frame(width:35, height:35)
                                .background(Color.green)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            //Text
                            Text("Chat")
                        }
                        .padding(.top,2)
                        .padding(.bottom,2)
                    }
                }
            }
            .navigationBarTitle("Tagihan")
        }.listStyle(.plain)
    }
}
