//
//  CustomInputRowView.swift
//  Movie Plus
//
//  Created by mac on 2022-07-09.
//

import SwiftUI

struct CustomInputRowView: View {
    let textfieldName: String
    let placeholderText: String
    var isSecureField:Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(textfieldName)
                .bold()
                .foregroundColor(.white)
            
            if isSecureField ?? false {
                SecureField(placeholderText, text: $text )
                    .textFieldStyle(.roundedBorder)
            } else {
                TextField(placeholderText, text: $text )
                    .textFieldStyle(.roundedBorder)
            }
            
        }
        //.foregroundColor(.white)
    }
}

struct CustomInputRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputRowView(textfieldName: "EMAIL", placeholderText: "email here", text: .constant(""))
    }
}
