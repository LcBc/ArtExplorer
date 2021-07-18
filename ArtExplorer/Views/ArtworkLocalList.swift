//
//  ArtworkLocalList.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 18/7/21.
//

import SwiftUI

struct ArtworkLocalList: View {
    @ObservedObject var manager = LocalAPIManager.sharedManager
    @State private var isLoading = true
    @State private var isPresenting = true
    let columns = [
        GridItem(.adaptive(minimum: 140))
    ]
    
    var body: some View {
        NavigationView {
        GeometryReader { geometry in
            ZStack{
                ScrollView {
                    LazyVGrid(columns:columns, spacing: 20) {
                        ForEach( manager.artworks, id: \.id) { art in
                            ArtworkPreview(artwork: art).frame(width: 120, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                }
                if manager.artworkListEmpty {                    
                        Text("Go see some artworks")
                            .font(.largeTitle)
                }

        }.navigationBarTitle("History").onAppear {
            manager.fetchArtworks()
        }
        }
    }
}

struct ArtworkLocalList_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkLocalList()
    }
}
}
