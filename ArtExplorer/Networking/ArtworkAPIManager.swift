//
//  ApiManager.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import Foundation
import Combine

var museumBasePath:String =  "https://api.artic.edu/api/v1"
var imageBasePath:String = "https://www.artic.edu/iiif/2"

class ArtworkAPIManager:ObservableObject {
    static let sharedManager = ArtworkAPIManager()
    @Published var artworks = [Artwork]()
    @Published var currentPage:Int = 0
    @Published var limit:Int = 10
    @Published var isLoading = true
    @Published var showingDetail = false
    var artworkListFull = false
    private var cancellable: AnyCancellable?
    private var artworkResponse  = ArtworkResponse(pagination: nil, data: nil, config: nil)
   
    var nextPage:String{
        get{
            return "\(museumBasePath)/artworks?page=\(currentPage + 1)&limit=\(limit)"
        }
    }
    
    var previousPage:String{
        get{
            return "\(museumBasePath)/artworks?page=\(currentPage - 1)&limit=\(limit)"
        }
    }
    
    private init(){
        
    }
    

    func fetchArtworks() {
        guard let url = URL(string: nextPage) else {
                      print("Invalid url...")
                      return
                  }
        self.isLoading = true
           cancellable = URLSession.shared.dataTaskPublisher(for: url)
               .tryMap { $0.data }
               .decode(type: ArtworkResponse.self, decoder: JSONDecoder())
               .receive(on: RunLoop.main)
               .catch { _ in Just(self.artworkResponse) }
               .sink { [weak self] in
                   self?.currentPage += 1
                self?.artworks.append(contentsOf: $0.data!)
                self?.isLoading = false
                   // If count of data received is less than perPage value then it is last page.
                if $0.data?.count ?? 0 < self?.limit ?? 10 {
                       self?.artworkListFull = true
                   }
           }
       }
    

    

  }

