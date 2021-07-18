//
//  ContentView.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var artworkManager = ArtworkAPIManager.sharedManager
    @ObservedObject var localManager = LocalAPIManager.sharedManager
    var body: some View {
        TabView {
            VStack{
                ArtworkList().onAppear(){
                    localManager.fetchArtworks()
                }
                if !artworkManager.showingDetail , let art = localManager.lastArtwork {
//                    Text("something about last seen piece")
                    ArtworkPreview(artwork: art)
                }
            }.tabItem {
                Image(systemName: "globe")
                Text("Artworks")
              }
            
            ArtworkLocalList()
             .tabItem {
                Image(systemName: "checkmark.seal.fill")
                Text("Favorites")
              }
        }
        

    }
        
}


