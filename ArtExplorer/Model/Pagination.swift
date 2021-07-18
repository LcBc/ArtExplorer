//
//  Pagination.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import Foundation

struct Pagination:Codable {
    let total:Int?
    let limit:Int?
    let current_page:Int?
    let offset:Int?
    var next_url:String?
    
}
//  "total": 115127,
//  "limit": 1,
//  "offset": 0,
//  "total_pages": 115127,
//  "current_page": 1,
//  "next_url": "https:\/\/api.artic.edu\/api\/v1\/artworks?page=2&limit=1"
