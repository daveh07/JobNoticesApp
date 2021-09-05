//
//  HomeView.swift
//  JobStation
//
//  Created by David on 5/9/21.
//

//IMPORT LIBRARIES & PACKAGES
import SwiftUI
import FirebaseAuth


// SIGN IN VIEW - LOGIN PAGE
struct HomeView : View {
    @EnvironmentObject var viewModel: AppViewModel
    @Namespace var animation
    
    @State var selectedTab = ScrollTabs[0]
    
    var body: some View{
        
        VStack(spacing: 0) {
            
            ZStack{
            
                HStack(spacing: 15) {
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                       Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(Color("Color1"))
                        .padding(.horizontal, 20)

                    })
                    
                    Text("SITE NOTICES")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Color1").opacity(0.8))
                        .frame(width: 200, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center), content: {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                           Image(systemName: "person")
                            .font(.title)
                            .foregroundColor(Color("Color1"))
                            .padding(.horizontal, 20)
                    })
                        
                })
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false, content:
                    {
                    
                    VStack{
                        
                        HStack{
                            
                            ForEach(ScrollTabs, id: \.self) {tab in
                                TabButton(title: tab, selectedTab: $selectedTab, animation: animation)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 10)
                        .font(.caption)
                    }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            })
            
            
         
        HStack {
                
                VStack(alignment: .leading, spacing: 12, content: {
                    
                    Text("You are signed in")
                        .padding(.vertical, 20)
                        .foregroundColor(Color("Color5"))
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Log Out")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("Color5"))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("Color3"))
                            .clipShape(Capsule())
                    })
                })
            }
            .frame(width: UIScreen.main.bounds.width)
            Spacer(minLength: 0)
        }
        .background(Color("Color5").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
}

// PREVIEW APP
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            HomeView()
                .environmentObject(AppViewModel())
        }
    }
}
