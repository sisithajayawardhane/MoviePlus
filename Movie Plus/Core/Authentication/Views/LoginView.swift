//
//  LoginView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-09.
//

import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
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
                
                Spacer()
                
                
                
                CustomInputRowView(textfieldName: "EMAIL",
                                   placeholderText: "email here",
                                   text: $email)

                CustomInputRowView(textfieldName: "PASSWORD",
                                   placeholderText: "password here",
                                   isSecureField: true,
                                   text: $password)
                
                Button {
                    viewModel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 340, height: 50)
                        .background(.yellow)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.bottom, 32)
                .foregroundColor(.blue)
            }
            .frame(minWidth: 350, idealWidth: 380, maxWidth: 390)
            
        }
        .ignoresSafeArea()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
