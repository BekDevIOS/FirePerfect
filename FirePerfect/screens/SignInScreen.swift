//
//  SignInScreen.swift
//  FirePerfect
//
//  Created by Utkirbek Mekhmonboev on 2/28/24.
//

import SwiftUI

struct SignInScreen: View {
    @EnvironmentObject var session: SessionStore
    
    @State var isLoading = false
    @State var email = "jasurbek@gmail.com"
    @State var password = "123456"
    
    func doSignIn(){
        isLoading = true
        SessionStore().signIn(email: email, password: password, completion: { (res,err) in
            isLoading = false
            if err != nil {
                print("Check email or password")
                return
            }
            session.listen()
            print("User signed in")
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    VStack{
                        Text("Welcome Back")
                            .font(.title).foregroundStyle(Color.red)
                        TextField("Email...", text: $email)
                            .padding(.leading, 10).frame(height: 45)
                            .background(Color.gray.opacity(0.2)).cornerRadius(22.5)
                        SecureField("Password...", text: $password)
                            .padding(.leading, 10).frame(height: 45)
                            .background(Color.gray.opacity(0.2)).cornerRadius(22.5)
                        Button(action: {
                            doSignIn()
                        }, label: {
                            Text("Sign In").foregroundStyle(Color.white)
                        }).frame(height: 45).frame(maxWidth: .infinity)
                            .background(.red).cornerRadius(22.5)
                    }.padding()
                    Spacer()
                    HStack{
                        Text("Don't have an account?")
                        NavigationLink(destination: SignUpScreen(), label:{
                            Text("Sign Up")}).foregroundStyle(.red)
                    }
                }
            }
            if isLoading{
                ProgressView()
            }
        }
    }
}
#Preview {
    SignInScreen()
}
