//
//  FeedView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-09.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var api_url = "https://yts.torrentbay.to/api/v2/list_movies.json"
    @State var details = APIStructure(
        status: "",
        status_message: "",
        data: dataStructure(
            page_number: 0,
            movies: [movie]()
        )
    )
    
    func loadData() {
        guard let url = URL(string: api_url) else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(APIStructure.self, from: data) {
                    DispatchQueue.main.async {
                        print(response)
                        self.details = response
                    }
                    return
                }
            }
        }.resume()
    }
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack(alignment:.leading) {

                    Text("Recent")
                        .font(.system(size: 30))
                        .bold()


                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 30) {
                            ForEach(details.data.movies, id: \.self){ movie in
                                NavigationLink{
                                    DetailView(movieName: movie.title,
                                               year: movie.year,
                                               image_URL: movie.large_cover_image,
                                               description: movie.summary)
                                } label: {
                                    MovieCardRowView(
                                        movieName: movie.title,
                                        year: movie.year,
                                        image_URL: movie.medium_cover_image)
                                }
                            }
                        }

                    }.onAppear(perform: loadData)
                    
                    .frame(height: 350)
                }
                .padding(.bottom, 400)
                .padding()
                Spacer()
            }

        }
        
        .navigationTitle("Movie Plus")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image("movieicon")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    authViewModel.signOut()
                } label: {
                    Image("logout")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)

                }

            }
        }

    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
