//
//  HomeScreen.swift
//  FirePerfect
//
//  Created by Utkirbek Mekhmonboev on 2/28/24.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var session: SessionStore
    
    func doSignOut(){
        if SessionStore().signOut() {
            session.listen()
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if let email = session.session?.email {
                    Text("Welcome " + email)
                }
            }
            .navigationBarItems( trailing: Button(action: {
                doSignOut()
            }, label: {
                Image("ic_signout")
            }))
            .navigationBarTitle("Post", displayMode: .inline)
        }
    }
}

#Preview {
    HomeScreen()
}
