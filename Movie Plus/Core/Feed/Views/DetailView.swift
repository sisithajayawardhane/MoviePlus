//
//  DetailView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-13.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let movieName: String
    let year: Int
    let image_URL: String
    let description: String
    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image(systemName: "arrow.left") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
                }
            }
        }
    
    var body: some View {
        ZStack {
            VStack{
                AsyncImage(url: URL(string: image_URL)){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(maxWidth: .infinity, maxHeight: 500)
                .ignoresSafeArea()
                
                Spacer()
            }
            
            
            ScrollView() {
                VStack {
                    HStack {
                        VStack(alignment:.leading) {
                            Text(movieName)
                                .font(.system(size: 40))
                                .bold()
                            Text(String(year))
                        }
                        .padding(30)
                        Spacer()
                    }
                    Text(description)
                        .padding(25)
                }
            }
            .frame(maxWidth:.infinity,maxHeight: 700)
            .background(Color.white)
            .padding(.top,400)
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieName: "joker", year: 2020, image_URL: "", description:"" )
    }
}
