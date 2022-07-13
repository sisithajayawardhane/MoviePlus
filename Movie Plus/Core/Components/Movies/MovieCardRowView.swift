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
                
            Text(movieName)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .bold()
            Text("\(String(year))")
                .foregroundColor(.gray)
        }
    }
}

struct MovieCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardRowView(movieName: "Joker", year: 0, image_URL: "")
    }
}
