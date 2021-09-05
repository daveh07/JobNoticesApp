//
//  SignInView.swift
//  JobStation
//
//  Created by David on 5/9/21.
//

//IMPORT LIBRARIES & PACKAGES
import SwiftUI
import FirebaseAuth


// SIGN IN VIEW - LOGIN PAGE
struct SignInView : View {
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var email = ""
    @State var password = ""
    
    var body: some View{
        
        VStack {
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //Dynamic Frame:
                .padding(.horizontal, 35)
                .padding(.vertical)
            
            HStack{
             
                VStack(alignment: .leading, spacing: 12, content: {
                    
                    Text("Login")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("Color5").opacity(0.7))
                    
                    Text("Please sign in to continue:")
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
            
            HStack {
                
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(Color("Color5"))
                    .frame(width: 35)
                
                SecureField("PASSWORD", text: $password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .background(Color("Color5").opacity(password == "" ? 0 : 0.15))
            .foregroundColor(Color("Color5"))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15) {
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                }, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Color1"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("Color4"))
                        .clipShape(Capsule())
                })
                .opacity(email != "" && password != "" ? 1 : 0.5)
                .disabled(email != "" && password != "" ?  false : true)
                
            }
            .padding(.top)
            
            HStack {
                NavigationLink("Reset Password", destination: ResetPassword())
                    .accentColor(Color("Color4"))
            }
            .padding(.top, 8)
            
            
            // Sign Up
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5){
                Text("Don't have an account?")
                    .foregroundColor(Color("Color3").opacity(0.6))
                
                NavigationLink("Create Account", destination: SignUpView())
                    .accentColor(Color("Color4"))
            }
            .padding(.vertical)
            
        }
        .background(Color("Color1").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
    
}
