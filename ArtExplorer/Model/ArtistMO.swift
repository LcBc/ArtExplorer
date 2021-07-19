//
//  ArtistMO.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 18/7/21.
//

import UIKit
import CoreData
import Foundation
 


class ArtistMO: NSManagedObject {
  @NSManaged var id:Int32
  @NSManaged var title:String?
  @NSManaged var birth_date:Int32
  @NSManaged var death_date:Int32
  @NSManaged var description_text:String?
    
    var artist:Artist{
        get{
            return Artist(id: Int(self.id), title: self.title, birth_date: Int(self.birth_date), death_date: Int(self.death_date), description: self.description_text)
        }
        set{
            
            self.id = Int32(truncating: newValue.id as NSNumber? ?? 0 )
            self.title = newValue.title
            self.birth_date = Int32(truncating: newValue.birth_date as NSNumber? ?? 0 )
            self.death_date = Int32(truncating: newValue.death_date as NSNumber? ?? 0 )
            self.description_text = newValue.description
            
        }
    }
}
