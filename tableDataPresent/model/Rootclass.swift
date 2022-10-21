//
//  Rootclass.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 18/10/22.
//

import Foundation
//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport


struct RootClass : Codable {

    let limit : Int?
    let products : [Product]?
    let skip : Int?
    let total : Int?


    enum CodingKeys: String, CodingKey {
        case limit = "limit"
        case products = "products"
        case skip = "skip"
        case total = "total"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        products = try values.decodeIfPresent([Product].self, forKey: .products)
        skip = try values.decodeIfPresent(Int.self, forKey: .skip)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
    }


}
