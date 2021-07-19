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
    @State var isPresentingLast = false
    var body: some View {
        TabView {
            VStack{
                ArtworkList()
                
                if !artworkManager.showingDetail , let art = localManager.lastArtwork {
                    Button(action:{
                        isPresentingLast = true
                    } , label: {
                        ArtworkPreview(artwork: art)
                    })
                    
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
        }.sheet(isPresented: $isPresentingLast) {
            if let art = localManager.lastArtwork {
                ArtworkDetail(artwork: art)
            }
        }.onAppear(){
            localManager.fetchArtworks()
        }
        

    }
        
}


