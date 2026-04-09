//
//  ContactsModel.swift
//  ContactBook
//
//  Created by CDMI on 07/04/26.
//

import Foundation

//struct ApiResponse: Codable {
//    let status, message: String
//    let data: [Datum]
//}
//
//struct Datum: Codable {
//    let id, name, surname, number: String
//    let email, company: String
//    let favorite: Bool
//
//}
//
//struct AddUserModel : Codable {
//    var name : String
//    var phone : String
//}


struct UserDataModel: Codable {
    let status, message: String
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case message = "Message"
        case data = "Data"
    }
}

// MARK: - Datum
struct Datum: Codable, Hashable , Identifiable {
    let id, name, surname, number: String
    let email, company: String
    let favorite: Bool

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, surname, number, email, company, favorite
    }
}

struct AddContactModel: Codable {
    let name : String
    let number: String
    let surname : String
    let email : String
    let company: String
    let favorite: Bool
}
