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
  @NSManaged var id:NSNumber?
  @NSManaged var title:String?
  @NSManaged var birth_date:NSNumber?
  @NSManaged var death_date:NSNumber?
  @NSManaged var description_text:String?
    
    var artist:Artist{
        get{
            return Artist(id: (self.id as! Int), title: self.title, birth_date: (self.birth_date as! Int), death_date: (self.death_date as! Int), description: self.description_text)
        }
    }
}
