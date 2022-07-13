//
//  RegistrationView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-09.
//

import SwiftUI


struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Image("movies")
                    .contrast(0.3)
                    .mask(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                         startPoint: .bottom, endPoint: .top))

                Spacer()
            }
            .background(.black)

            VStack(spacing: 20) {
                
                CustomInputRowView(textfieldName: "FULL NAME",
                                   placeholderText: "full name here",
                                   text: $fullname)
                
                CustomInputRowView(textfieldName: "USERNAME",
                                   placeholderText: "username here",
                                   text: $username)
                
                CustomInputRowView(textfieldName: "EMAIL",
                                   placeholderText: "email here",
                                   text: $email)

                CustomInputRowView(textfieldName: "PASSWORD",
                                   placeholderText: "password here",
                                   isSecureField: true,
                                   text: $password)
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 340, height: 50)
                        .background(.yellow)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            .frame(minWidth: 350, idealWidth: 380, maxWidth: 390)
            
        }
        .ignoresSafeArea()

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
