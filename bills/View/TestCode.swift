//
//  TestCode.swift
//  bills
//
//  Created by una ivan on 04/08/23.
//
import SwiftUI

struct TestCode: View {
    @StateObject private var dataManager = DataManager()
    
    var body: some View {
        VStack {
            if let userData = dataManager.userData {
                ForEach(userData.billdetail, id: \.id) { billDetail in
                    switch billDetail.billtypedetail {
                    case 1:
                        BillDetailView(price: billDetail.billtotalitem, name: billDetail.billname, status: "Belum bayar")
                    case 2:
                        ProgressBillDetailView(price: billDetail.billtotalitem, name: billDetail.billname, date: billDetail.billdatepayment ?? "")
                    case 3:
                        LunasBillDetailView(price: billDetail.billtotalitem, name: billDetail.billname, date: billDetail.billdatepayment ?? "")
                    default:
                        EmptyView()
                    }
                }.listRowBackground(
                    Rectangle()
                        .fill(Color.white)
                        .padding(4)
                        .cornerRadius(28)
                )
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            dataManager.fetchData()
        }
    }
}

struct BillDetailView: View {
    let price: Int
    let name: String
    let status: String
    
    var body: some View {
        NavigationLink(destination:About()) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Rp \(formatCurrency(price))")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(name)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack(alignment: .center, spacing: 2) {
                    HStack(spacing: 2) {
                        Button("Bayar") {
                            
                        }.buttonStyle(.bordered)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(.top, 6)
            .padding(.bottom, 6)
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

struct ProgressBillDetailView: View {
    let price: Int
    let name: String
    let date: String
    
    var body: some View {
        NavigationLink(destination:About()) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Rp \(formatCurrency(price))")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(name)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack(alignment: .center, spacing: 2) {
                    HStack(spacing: 2) {
                        Image(systemName: "hourglass")
                            .foregroundColor(Color.yellow)
                            .font(.system(size: 14))
                        Text("Progress")
                            .font(.system(size: 14))
                            .foregroundColor(Color.yellow)
                    }
                    Text("Dibayar tgl \(date)")
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 6)
            .padding(.bottom, 6)
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

struct LunasBillDetailView: View {
    let price: Int
    let name: String
    let date: String
    
    var body: some View {
        NavigationLink(destination:About()) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Rp \(formatCurrency(price))")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    Text(name)
                        .font(.system(size: 12))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                VStack(alignment: .center, spacing: 2) {
                    HStack(spacing: 2) {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color.green)
                            .font(.system(size: 14))
                        Text("Lunas")
                            .font(.system(size: 14))
                            .foregroundColor(Color.green)
                    }
                    Text("Dibayar tgl \(date)")
                        .font(.system(size: 11))
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 6)
            .padding(.bottom, 6)
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

