//
//  MovieCardRowView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-07.
//

import SwiftUI

struct MovieCardRowView: View {
    let movieName: String
    let year: Int
    let genre: [String]
    let image_URL: String
    var body: some View {
        VStack(alignment:.leading) {
            AsyncImage(url: URL(string: image_URL)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 200, height: 280)
                
            Text(formattedName(name: movieName))
                .foregroundColor(.black)
                .font(.system(size: 15))
                .bold()
            Text(formattedGenres(genres: genre))
                .foregroundColor(.gray)
        }
    }
}

func formattedName(name: String) -> String {
    let limit = 20
    
    if (name.count > limit){
        return name.prefix(limit) + "..."
    }
    return name
}

func formattedGenres(genres:[String]) -> String{
    var g = ""
    
    for i in 0...genres.count-1 {
        if i == 3 {
            break
        }
        g = g + genres[i]
        if(i != genres.count-1) && (i != 2){
            g = g + ", "
        }
        
            
    }
    
    return g
}

struct MovieCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardRowView(movieName: "Joker", year: 0, genre: [""], image_URL: "")
    }
}
