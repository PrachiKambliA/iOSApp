//
//  Request.swift
//  PG&EApp
//
//  Created by Nghia Phan on 5/31/20.
//  Copyright © 2020 Infosys. All rights reserved.
//

import UIKit

class Request {
    
    //MARK: Properties
    
    var id: String
    var type: String // Eg: Material, Tool or Meter...
    var subtype: String // Electrical Material, Gas Material
    var lanId: String
    var location: String
    var status: String
    var date: Date
    
    //MARK; Initialization
    
    init(id: String, type: String, subtype: String, lanId: String, location: String, status: String, date: Date) {
        self.id = id
        self.type = type
        self.subtype = subtype
        self.lanId = lanId
        self.location = location
        self.status = status
        self.date = date
    }
}
