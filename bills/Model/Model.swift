//
//  Model.swift
//  bills
//
//  Created by una ivan on 04/08/23.
//

import Foundation

struct UserData: Codable,Identifiable {
    let id: Int
    let name: String
    let billtotal: Int
    let billdetail: [BillDetail]
}

struct BillDetail: Codable {
    let id: Int
    let billtypedetail: Int
    let billpaymentstatus: String
    let billname: String
    let billtotalitem: Int
    let billdatepayment: String?
}
