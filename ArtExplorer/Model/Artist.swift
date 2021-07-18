//
//  Artist.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 17/7/21.
//

import SwiftUI

struct Artist:Codable,Identifiable {
    
    let id:Int?
    let title:String?
    let birth_date:Int?
    let death_date:Int?
    let description:String?
    // "ebe50463-49dc-187e-6072-296c2432b571"
    //https://www.artic.edu/iiif/2/{identifier}/full/200,/0/default.jpg
    
   }
