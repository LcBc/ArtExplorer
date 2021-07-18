//
//  Artwork.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import Foundation


struct Artwork:Codable,Identifiable {
    
    let id:Int?
    let title:String?
    let place_of_origin:String?
    let artist_id:Int?
    let artist_title:String?
    let image_id:String?
    let date_display:String?
    let dimensions:String?
    let medium_display:String?
    let style_title:String?
    var last_seen:Date?
    var thumbnail_Path:URL?{
        get{
            if let id = self.image_id {
               return URL(string:  "https://www.artic.edu/iiif/2/\(id)/full/200,/0/default.jpg")
            }else{
              //  print(self)
                return nil
            }
            
        }
    }
    var highRes_Path:URL?{
        get{
            if let id = self.image_id {
               return URL(string: "https://www.artic.edu/iiif/2/\(id)/full/400,/0/default.jpg")
            }else{
                return nil
            }
            
        }
    }
    // "ebe50463-49dc-187e-6072-296c2432b571"
    //https://www.artic.edu/iiif/2/{identifier}/full/200,/0/default.jpg
   }


extension Date {
    
    var formatedDate:String{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM yyyy HH:mm"
            return dateFormatter.string(from: self)
        }
    }
    
}
