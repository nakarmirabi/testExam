//
//  ImagesModel.swift
//  TestExam
//
//  Created by mercantile on 2019-07-04.
//  Copyright © 2019 Rabirb. All rights reserved.
//

import Foundation

//"id": 8798,
//"url": "https://splashbase.s3.amazonaws.com/newoldstock/regular/tumblr_ph8vgdJV2r1sfie3io1_1280.jpg",
//"large_url": "https://splashbase.s3.amazonaws.com/newoldstock/large/tumblr_ph8vgdJV2r1sfie3io1_1280.jpg",
//"source_id": null

class Images: NSObject {
    var id :String?
    var url:String?
    var large_url:String?
    var source_id:String?
    
    init(json: NSDictionary) {
        id = json["id"] as? String
        url = json["url"] as? String
        large_url = json["large_url"] as? String
        source_id = json["source_id"] as? String
    }
    
    override init() {
        super.init()
    }
}

