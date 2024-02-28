

import Foundation
import Combine
import Firebase
import FirebaseAuth

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: User? {didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            if let user = user {
                print("Got user: \(user)")
                self.session = User(uid: user.uid, email: user.email, displayName: user.displayName)
            }else {
                self.session = nil
            }
        }
    }
    // additional methods (sign up, sign in) will be here
    
    func sginUp(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    func signIn(email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func signOut() -> Bool{
        do {
            try Auth.auth().signOut()
            self.session = nil
            return true
        }catch{
            return false
        }
    }
}
