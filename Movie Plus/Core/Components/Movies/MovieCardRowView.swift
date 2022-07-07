//
//  MovieCardRowView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-07.
//

import SwiftUI

struct MovieCardRowView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(20))
                .frame(width: 180, height: 180)
        }
    }
}

struct MovieCardRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardRowView()
    }
}
