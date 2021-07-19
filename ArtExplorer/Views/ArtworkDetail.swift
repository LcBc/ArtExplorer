//
//  ArtworkDetail.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 16/7/21.
//

import SwiftUI

struct ArtworkDetail: View {
    @State var artwork: Artwork
    @ObservedObject var artistManager = ArtistAPIManager.sharedManager
    var body: some View {
        ScrollView{
            LazyVStack{
                VStack{
                    if let url = artwork.highRes_Path {
                        AsyncImage(
                            url: url,
                            placeholder: { Text("Loading ...") }
                        ).aspectRatio(contentMode: .fit).cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                        )
                        .padding([.top, .horizontal])
                        
                    }else{
                        Image(uiImage: #imageLiteral(resourceName: "not-found"))
                            .resizable().aspectRatio(contentMode: .fit)
                    }
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(artwork.title ?? "")")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundColor(.primary).fixedSize(horizontal: false, vertical: true)
                            HStack{
                                Text("Author: \(artwork.artist_title ?? "Unknown")")
                                    .font(.title2)
                                    .foregroundColor(.secondary)
                                    .lineLimit(3)
                                if let _ = artwork.artist_id {
                                    Button("Show more"){
                                        artistManager.showingDetail = true
                                    }
                                }
                                
                            }
                            Text("Origin: \(artwork.place_of_origin ?? "Unknown")")
                                .font(.title3)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            Text("Period: \(artwork.date_display ?? "Unknown")")
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            Text("Style: \(artwork.style_title ?? "Unknown")")
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            Text("Materials: \(artwork.medium_display ?? "Unknown")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                            Text("Dimensions: \(artwork.dimensions ?? "Unknown")")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .lineLimit(3)                            
                        }.onAppear{
                            ArtworkAPIManager.sharedManager.showingDetail = true
                            LocalAPIManager.sharedManager.save(artwork: artwork)
                            if let artist = artwork.artist_id {
                                artistManager.fetch(artist: artist)
                            }
                        }.onDisappear{
                            ArtworkAPIManager.sharedManager.showingDetail = false
                        }
                        Spacer()
                    }.padding()
                    
                    
                }
            }
        }.navigationBarTitle("Artwork Detail").sheet(isPresented: $artistManager.showingDetail) {
            AuthorDetail(artist: $artistManager.artist)
        }
        
    }
}



