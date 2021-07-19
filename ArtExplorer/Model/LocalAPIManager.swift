//
//  LocalApiManager.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 18/7/21.
//

import CoreData
import Foundation
 


class LocalAPIManager:ObservableObject {
    static let sharedManager = LocalAPIManager()
    @Published var artworks = [Artwork]() {
        didSet{            
            lastArtwork = self.artworks.first
        }
    }
    @Published var lastArtwork:Artwork?
    @Published var artworkListEmpty = true
    private init(){
    }
    
    func save(artwork:Artwork) {
        let persistenceController = PersistenceController.shared
        let moc  = persistenceController.container.viewContext

        let artworkFetch: NSFetchRequest<NSFetchRequestResult> = ArtworkMO.fetchRequest()
        let id = Int32(truncating: artwork.id as NSNumber? ?? 0 )

        artworkFetch.predicate = NSPredicate(format: "id == %i",id)
        do {
            let fetchedArtwork = try moc.fetch(artworkFetch) as! [ArtworkMO]
            var artworkMO:ArtworkMO!
            
            if let existingArtwork = fetchedArtwork.first {
                artworkMO = existingArtwork
            }else{
                artworkMO = (NSEntityDescription.insertNewObject(forEntityName: "Artwork", into: persistenceController.container.viewContext) as! ArtworkMO)
            }
            artworkMO.artwork = artwork
            artworkMO.last_seen = Date()
            self.lastArtwork = artworkMO.artwork
            try moc.save()
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
    
    func save(artist:Artist){
        let persistenceController = PersistenceController.shared
        let moc  = persistenceController.container.viewContext

        let artistFetch: NSFetchRequest<NSFetchRequestResult> = ArtistMO.fetchRequest()
        let id = Int32(truncating: artist.id as NSNumber? ?? 0 )
        artistFetch.predicate = NSPredicate(format: "id == %i",id)
        do {
            let fetchedArtists = try moc.fetch(artistFetch) as! [ArtistMO]
            var artistMO:ArtistMO!
            
            if let existingArtist = fetchedArtists.first {
                artistMO = existingArtist
            }else{
                artistMO = (NSEntityDescription.insertNewObject(forEntityName: "Artist", into: persistenceController.container.viewContext) as! ArtistMO)
            }
            artistMO.artist = artist
            try moc.save()
            print("artist stored")
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }

    }
    
    
    func get(artist: Int) ->Artist{
        
        
        return Artist(id: nil, title: nil, birth_date: nil, death_date: nil, description: nil)
    }
    
    
    func fetchArtworks() {
        let persistenceController = PersistenceController.shared
        let moc  = persistenceController.container.viewContext

        let artworkFetch: NSFetchRequest<NSFetchRequestResult> = ArtworkMO.fetchRequest()
        do {
            let fetchedArtwork = try moc.fetch(artworkFetch) as! [ArtworkMO]
            if fetchedArtwork.count > 0 {
                self.artworkListEmpty = false
                self.artworks  = fetchedArtwork.map{$0.artwork}.sorted(by: {($0.last_seen ?? Date()) > ($1.last_seen ?? Date())})
                
            }else{
                self.artworkListEmpty = true
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }

        
        
    }
    
    
}
