//
//  FeedView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-09.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack{
                Image("movieicon")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Movie Plus")
                    .font(.system(size: 30))
                    .bold()
            }
            
            
            
            Text("Recent")
                .font(.system(size: 30))
                .bold()
          
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 30) {
                    ForEach(0...20, id: \.self){ _ in
                        MovieCardRowView(movieName: "Joker", genre: "Comedy")
                    }
                }
                
            }
            .frame(height: 350)

            Spacer()
            
        }
        .padding()
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
