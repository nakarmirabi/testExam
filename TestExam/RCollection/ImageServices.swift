//
//  ImageServices.swift
//  TestExam
//
//  Created by mercantile on 2019-07-04.
//  Copyright © 2019 Rabirb. All rights reserved.
//

import Foundation
import Alamofire

class ImageServices {
    typealias completionHandler = ([Images]) -> ()
    typealias FailureHandler = (_ message: String) -> ()
   // static var getImageLists = ImageServices()
    func makeNetworkCall(url : String,compltion : @escaping completionHandler,failure : @escaping FailureHandler) {
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch (response.result) {
                case .success:
                    var imageLists = [Images]()
                    let dict = response.result.value as! NSDictionary
                    if let reposArray = dict["images"] as? [NSDictionary] {
                        for item in reposArray {
                            imageLists.append(Images(json: item))
                        }
                    }
                    compltion(imageLists)
                    break
                    
                case .failure:
                    failure(response.error!.localizedDescription)
                    break
                }
                
                
        }
    }
}
