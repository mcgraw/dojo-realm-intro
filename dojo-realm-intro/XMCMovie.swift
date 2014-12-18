//
//  XMCMovie.swift
//  dojo-realm-intro
//
//  Created by David McGraw on 12/17/14.
//  Copyright (c) 2014 David McGraw. All rights reserved.
//

import UIKit
import Realm

class XMCMovie: RLMObject {
    dynamic var id = ""
    dynamic var title = ""
    dynamic var tomatometer = 0
    dynamic var consensus = ""
    dynamic var imageName = ""
    
    override class func primaryKey() -> String! {
        return "id"
    }
    
    override init() {
        super.init()
    }
    
    init(id: NSString, title: NSString, tomatometer: Int, consensus: NSString, imageName: NSString) {
        super.init()
        
        self.id = id
        self.title = title
        self.tomatometer = tomatometer
        self.consensus = consensus
        self.imageName = imageName
    }
}
