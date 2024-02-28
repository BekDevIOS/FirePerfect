//
//  SignUpScreen.swift
//  FirePerfect
//
//  Created by Utkirbek Mekhmonboev on 2/28/24.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.presentationMode) var presentation
    
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    
    func doSignUp(){
        isLoading = true
        SessionStore().sginUp(email: email, password: password, completion: { (res,err) in
            isLoading = false
            if err != nil {
                print("User not created")
                return
            }
            print("User created")
            self.presentation.wrappedValue.dismiss()
        })
    }
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    VStack{
                        Text("Create your account").font(.title)
                            .foregroundStyle(.red)
                        TextField("Fullname...", text: $fullname)
                            .frame(height: 45).padding(.leading, 10)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(22.5)
                        TextField("Email...", text: $email)
                            .frame(height: 45).padding(.leading, 10)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(22.5)
                        SecureField("Password...", text: $password)
                            .frame(height: 45).padding(.leading, 10)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(22.5)
                        Button(action: {
                            doSignUp()
                        }, label: {
                            Text("Sign Up").foregroundStyle(.white)
                        })
                        .frame(height: 45).frame(maxWidth: .infinity)
                            .background(.red)
                            .cornerRadius(22.5)
                    }.padding()
                    Spacer()
                    HStack{
                        Text("Already have an account?")
                       Button(action: {
                           self.presentation.wrappedValue.dismiss()
                       }, label: {
                           Text("Sign In").foregroundStyle(.red)
                       })
                    }
                }
            }
            if isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
