//
//  AuthorDetail.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 17/7/21.
//

import SwiftUI

struct AuthorDetail: View {
    @Binding var artist:Artist
    var body: some View {
       // ScrollView{
         
            VStack{
                Text("\(artist.title ?? "")")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                
                Text("\(artist.birth_date ?? 0) -  \(artist.death_date ?? 0)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                if let description = artist.description {
                   HTMLView(string: description)
                    
                }else{
                    Text("No aditional information")
                }
            }
           
      //  }
    }
}


