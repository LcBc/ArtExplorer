//
//  File.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 18/7/21.
//

import UIKit
import CoreData
import Foundation
 
class ArtworkMO: NSManagedObject {
    
    @NSManaged public var artist_id: Int32
    @NSManaged public var artist_title: String?
    @NSManaged public var date_display: String?
    @NSManaged public var dimensions: String?
    @NSManaged public var id: Int32
    @NSManaged public var image_id: String?
    @NSManaged public var last_seen: Date?
    @NSManaged public var medium_display: String?
    @NSManaged public var place_of_origin: String?
    @NSManaged public var style_title: String?
    @NSManaged public var title: String?
    
    var artwork:Artwork{
        get{
           let artist_id = Int(self.artist_id)
            
            return Artwork(id: Int(self.id), title: self.title, place_of_origin: self.place_of_origin, artist_id: artist_id == 0 ? nil :artist_id , artist_title: self.artist_title, image_id: self.image_id, date_display: self.date_display, dimensions: self.dimensions, medium_display: self.medium_display, style_title: self.style_title, last_seen: self.last_seen)
        }
        set{
            
            self.id = Int32(truncating: newValue.id as NSNumber? ?? 0 )
            self.title = newValue.title
            self.place_of_origin = newValue.place_of_origin
            self.artist_id = Int32(truncating: newValue.artist_id as NSNumber? ?? 0 )
            self.artist_title = newValue.artist_title
            self.image_id = newValue.image_id
            self.date_display = newValue.date_display
            self.dimensions = newValue.dimensions
            self.medium_display = newValue.medium_display
            self.style_title = newValue.style_title
        }
    }
    
    

}
