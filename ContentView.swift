//
//  ContentView.swift
//  JobStation
//
//  Created by David H on 29/8/21.
//

//IMPORT LIBRARIES & PACKAGES
import SwiftUI
import FirebaseAuth


//AppViewModel & FUNCTIONS
class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
        
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
        }
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    func resetPassword(email:String, resetCompletion:@escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            if let error = error {
                resetCompletion(.failure(error))
            } else {
                resetCompletion(.success(true))
            }
        })
    }
    
}


//NAVIGATION VIEW CONTROLLER
struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView{
            if viewModel.isSignedIn {
               HomeView()
            }
            else {
                SignInView()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}


// PREVIEW APP
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            ContentView()
                .environmentObject(AppViewModel())
        }
    }
}
