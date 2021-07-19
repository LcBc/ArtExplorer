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
                if  let birthDate = artist.birth_date {
                    let deathDate = (artist.death_date ?? 0)
                    Text("\(birthDate) - \(deathDate == 0 ? "Present" : "\(deathDate)")")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                }else{
                    Text("Date Unknown ")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

                if let description = artist.description {
                   HTMLView(string: description)
                    
                }else{
                    Text("No aditional information")
                }
            }
           
      //  }
    }
}


