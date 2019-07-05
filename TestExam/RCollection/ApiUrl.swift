//
//  ApiUrl.swift
//  TestExam
//
//  Created by mercantile on 2019-07-04.
//  Copyright © 2019 Rabirb. All rights reserved.
//

import Foundation

struct ApiUrl {
    static let latestImage = BaseURL.url + "latest"
//    http://www.splashbase.co/api/v1/images/search?query=laptop
    static func serachLists(key: String) -> String {
        return  BaseURL.url + "search?query=\(key)"
    }
}
