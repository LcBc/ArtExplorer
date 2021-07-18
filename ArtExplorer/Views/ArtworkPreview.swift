//
//  ArtworkPreview.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 13/7/21.
//

import SwiftUI

struct ArtworkPreview: View {
    @State var artwork:Artwork
    var body: some View {
        
        NavigationLink(destination: ArtworkDetail(artwork: $artwork)) {
        VStack {
            if let url = artwork.thumbnail_Path {
            
            AsyncImage(
                    url: url,
                     placeholder: { Text("Loading ...") }
            ).frame(width: 135, height: 50, alignment: .top).aspectRatio(contentMode: .fit)
                
            }else{
                Image(uiImage: #imageLiteral(resourceName: "not-found"))
                    .resizable().frame(width: 135, height: 50, alignment: .top).aspectRatio(contentMode: .fit)
            }
            
            HStack {
                    VStack(alignment: .leading) {
                        Text("\(artwork.title ?? "")")
                            .font(.caption)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                        Text("\(artwork.artist_title ?? "UNKNOWN")")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                        if let lastSeen = artwork.last_seen {
                            Text("last seen: \(lastSeen.formatedDate)")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                                .lineLimit(3)
                        }
                        
                    }.frame(width: 130, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .top)
                    
             
            }
            
        }.cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        ).frame(width: 135, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    }
}

