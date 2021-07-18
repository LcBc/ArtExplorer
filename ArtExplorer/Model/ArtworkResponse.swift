//
//  ArtworkRequest.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import Foundation

struct ArtworkResponse: Codable {
    let pagination:Pagination?
    let data: [Artwork]?
    let config:Config?
   
}
