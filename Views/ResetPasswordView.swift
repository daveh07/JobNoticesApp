//
//  ResetPasswordView.swift
//  JobStation
//
//  Created by David on 5/9/21.
//

import SwiftUI
import FirebaseAuth

// RESET PASSWORD VIEW
struct ResetPassword : View {
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State private var showAlert = false
    @State private var errString: String?
    
    
    var body: some View{
        
        VStack {
    
            HStack{
             
                VStack(alignment: .leading, spacing: 12, content: {
                    
                    Text("Reset Password")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("Color5").opacity(0.7))
                    
                    Text("Please enter email to reset password")
                        .foregroundColor(Color("Color5").opacity(0.5))
                })
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading, 15)
            
            HStack {
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(Color("Color5"))
                    .frame(width: 35)
                
                TextField("EMAIL", text: $email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .background(Color("Color5").opacity(email == "" ? 0 : 0.15))
            .foregroundColor(Color("Color5"))
            .cornerRadius(15)
            .padding(.horizontal)
            
            
            HStack(spacing: 15) {
                
                Button(action: {
                    viewModel.resetPassword(email: email) { (result) in
                        switch result {
                        case .failure(let error):
                                self.errString = error.localizedDescription
                        case .success( _):
                                break
                        }
                        self.showAlert = true
                    }
                }, label: {
                    Text("Reset Password")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Color1"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("Color4"))
                        .clipShape(Capsule())
                })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Password Reset"),
                          message: Text(self.errString ?? "Success. Please check your email"),
                          dismissButton: .default(Text("OK")){
                            self.presentationMode.wrappedValue.dismiss()
                          })
                }
            }
            .padding(.top)

            Spacer(minLength: 0)
            
        }
        .background(Color("Color1").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
}

