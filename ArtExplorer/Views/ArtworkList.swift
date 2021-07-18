//
//  ArtworkList.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 15/7/21.
//

import SwiftUI

struct ArtworkList: View {
    @ObservedObject var manager = ArtworkAPIManager.sharedManager
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
                        
                        if manager.artworkListFull == false{
                            ProgressView()
                                .onAppear {
                                    manager.fetchArtworks()
                                }
                        }
                    }
                    
                }
                
                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }.frame(width: geometry.size.width / 2,
                        height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(manager.isLoading ? 1 : 0)
            }
        }.navigationBarTitle("List of Artworks")
        }
    }
}

