//
//  AuthenticationView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 11/04/2021.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var username = ""
    @State private var password = ""
    @State var signUp = false
    
    var body: some View {
        VStack {
            HStack {
                Text("IMPRESARIO")
                    
                    .font(.custom("Marker Felt Wide", size: 30, relativeTo: .largeTitle))
                    .foregroundColor(Color.init(.darkGray))
                    .padding(.leading)
                Spacer()
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.init(.darkGray), lineWidth: 2)
                    .frame(width: 70, height: 25, alignment: .center)
                    .overlay(Button(action: {
                        print("YES")
                    }, label: {
                        Text(" Sign up ")
                            .foregroundColor(Color.init(.darkGray))
                            .font(.custom("Marker Felt", size: 20, relativeTo: .largeTitle))
                    }))
                    .padding(.trailing)
            }
            Spacer()
            VStack(alignment: .center) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                Spacer()
                    .frame(height: 50)
                RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(          Color.init(.darkGray))
                    .frame(width: 200, height: 40, alignment: .center)
                    .overlay(Button(action: {
                        signUp.toggle()
                    }, label: {
                        Text(" Sign In ")
                            .foregroundColor(.white)
                            .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
                    }))
                Spacer()
                    .frame(height: 30)
                Text("Forgot password ?")
                    .foregroundColor(Color.init(.darkGray))
                    .font(.custom("Marker Felt Wide", size: 20, relativeTo: .largeTitle))
            }
            Spacer()
        }
        .padding()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
