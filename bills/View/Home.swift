//
//  Home.swift
//  bills
//
//  Created by una ivan on 03/08/23.
//

import SwiftUI

struct Home: View {
    @StateObject private var dataManager = DataManager()
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
                    
                    if let userData = dataManager.userData {
                        ForEach(userData.billdetail, id: \.id) { billDetail in
                            NavigationLink(destination:About()) {
                                HStack(spacing:12){
                                    VStack(alignment: .leading, spacing: 2){
                                        Text("\(formatCurrency(billDetail.billtotalitem))")
                                            .font(.system(size: 18))
                                            .fontWeight(.bold)
                                        Text((billDetail.billname))
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
//                                        Text("Dibayar tgl 10")
//                                            .font(.system(size: 11))
//                                            .foregroundColor(Color.gray)
                                        if let datePayment = billDetail.billdatepayment {
                                            Text("Dibayar \(datePayment)")
                                                .font(.system(size: 11))
                                                .foregroundColor(Color.gray)
                                        } else {
                                            Text("Date Payment: Not available")
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
                    } else {
                        Text("Loading...")
                    }
                }.onAppear {
                    dataManager.fetchData()
                }
                
                Section(header: Text("Tambahkan tagihan baru")){
                    NavigationLink(destination:About()) {
                        HStack(spacing:12){
                            VStack(alignment: .leading, spacing: 2){
                                Text("Tambah")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.blue)
                            }
                        }
                        .padding(.top, 6)
                        .padding(.bottom, 6)
                    }.listRowSeparator(.hidden)
                }
                
            }
            .listStyle(.insetGrouped)
            . listRowSeparator(. hidden)
            .navigationBarTitle(Text("Tagihan").font(.subheadline), displayMode: .large)
        }
    }
    func formatCurrency(_ amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp "
        formatter.locale = Locale(identifier: "id_ID")
        return formatter.string(from: NSNumber(value: amount)) ?? ""
    }
}


struct TopContent: View {
    @StateObject private var dataManager = DataManager()
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack{
                if let userData = dataManager.userData {
                    Text("\(formatCurrency(userData.billtotal))")
                        .font(.system(size: 42))
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .frame(width: .infinity)
                } else {
                    Text("Data not found...")
                }
            }.onAppear {
                dataManager.fetchData()
            }
            
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
    func formatCurrency(_ amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp "
        formatter.locale = Locale(identifier: "id_ID")
        return formatter.string(from: NSNumber(value: amount)) ?? ""
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
