//
//  APIservice.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 06/10/22.
//

import Foundation
import Alamofire
class APIservice {
    
    fileprivate var baseURL = ""
    typealias userCallBack = ( _ user: [Product]?, _ status: Bool, _ message:String) -> Void
    var callBack: userCallBack?
    init(baseURL: String = "") {
        self.baseURL = baseURL
    }
    func getResponse() -> DataRequest {
        Alamofire.request(self.baseURL,method: .get).response {
            (responseData) in
            guard let data = responseData.data else {return}
            do {
                let users = try JSONDecoder().decode(RootClass.self, from: data)
                self.callBack?(users.products, true, "")
            } catch {
                print("Error")
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
            
            }
    func completionHandler(callBack: @escaping userCallBack){
        self.callBack = callBack
    }
}
