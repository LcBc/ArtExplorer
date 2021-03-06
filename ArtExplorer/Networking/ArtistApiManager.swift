//
//  ArtistApiManager.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 17/7/21.
//

import Foundation
import Combine

class ArtistAPIManager:ObservableObject {
    static let sharedManager = ArtistAPIManager()
    @Published var isLoading = true
    @Published var showingDetail = false
    @Published var artist = Artist(id: nil, title: nil, birth_date: nil, death_date: nil, description: nil)    
    
    private var cancellable: AnyCancellable?
    private var artistResponse = ArtistResponse(data: nil, config: nil)

    private init(){
        
    }
    
    func fetch(artist:Int){
        
        if !NetworkMonitor.sharedInstance.hasConnection{
            self.artist = LocalAPIManager.sharedManager.get(artist: artist)
        }
        
        guard let url = URL(string: "\(museumBasePath)/artists/\(artist)") else {
                      print("Invalid url...")
                      return
                  }
        self.isLoading = true
           cancellable = URLSession.shared.dataTaskPublisher(for: url)
               .tryMap { $0.data }
               .decode(type: ArtistResponse.self, decoder: JSONDecoder())
               .receive(on: RunLoop.main)
               .catch { _ in
                Just(self.artistResponse) }
               .sink { [weak self] in
                if let data = $0.data{
                    self?.artist =  data
                    LocalAPIManager.sharedManager.save(artist: data)
                }
                
                //self?.showingDetail = true
           }
        
        
    }
    
  }
