//
//  responseModel.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 06/10/22.
//

import Foundation

//
//    Product.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Product : Codable {

    let brand : String?
    let category : String?
    let descriptionField : String?
    let discountPercentage : Float?
    let id : Int?
    let images : [String]?
    let price : Int?
    let rating : Float?
    let stock : Int?
    let thumbnail : String?
    let title : String?


    enum CodingKeys: String, CodingKey {
        case brand = "brand"
        case category = "category"
        case descriptionField = "description"
        case discountPercentage = "discountPercentage"
        case id = "id"
        case images = "images"
        case price = "price"
        case rating = "rating"
        case stock = "stock"
        case thumbnail = "thumbnail"
        case title = "title"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        discountPercentage = try values.decodeIfPresent(Float.self, forKey: .discountPercentage)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        rating = try values.decodeIfPresent(Float.self, forKey: .rating)
        stock = try values.decodeIfPresent(Int.self, forKey: .stock)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }


}
