//
//  Response.swift
//  Pp
//
//  Created by Nathaniel Whittington on 11/5/21.
//

import Foundation


struct Response : Codable {
    let hits : [Hit]
}

struct Hit : Codable  {
    let tags : String
    let previewURL : String
    let downloads : Int
    let pageURL : String
    let likes : Int
}
