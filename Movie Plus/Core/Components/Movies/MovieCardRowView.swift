//
//  MovieCardRowView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-07.
//

import SwiftUI

struct MovieCardRowView: View {
    let movieName: String
    let genre: String
    var body: some View {
        VStack(alignment:.leading) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 280)
                .shadow(radius: 20,x: 0,y: 13)
                
            Text(movieName)
                .font(.system(size: 22))
                .bold()
            Text(genre)
                .foregroundColor(.gray)
        }
    }
}

struct MovieCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardRowView(movieName: "Joker", genre: "Comedy")
    }
}
