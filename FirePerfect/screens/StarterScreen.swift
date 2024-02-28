//
//  StarterScreen.swift
//  FirePerfect
//
//  Created by Utkirbek Mekhmonboev on 2/28/24.
//

import SwiftUI

struct StarterScreen: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack{
            if self.session.session != nil {
                HomeScreen()
            }else{
                SignInScreen()
            }
        }.onAppear{
            session.listen()
        }
    }
}

#Preview {
    StarterScreen()
}
