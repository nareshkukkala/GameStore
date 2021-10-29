//
//  ContentView.swift
//  game store
//
//  Created by naresh kukkala on 26/09/21.
//

import SwiftUI

//var results: [Result] = []

struct ContentView: View {
    
    init() {
//            UITabBar.appearance().backgroundColor = UIColor.gray
            UITabBar.appearance().backgroundImage = UIImage()
                UITabBar.appearance().isTranslucent = true
                UITabBar.appearance().backgroundColor = .clear
                UITabBar.appearance().isOpaque = false
        }
    var body: some View {
        
        TabView{
            Home().tabItem {
                
                Image("home").font(.system(size: 26))
                Text("Games").font(.system(size: 26))
            }
            
            App().tabItem {
                
                Image("globe").font(.system(size: 26))
                Text("Apps").font(.system(size: 26))
            }
            
            Text("Movies").tabItem {
                
                Image("cart").font(.system(size: 26))
                Text("Movies").font(.system(size: 26))
            }
            
            Text("Books").tabItem {
                
                Image("heart").font(.system(size: 26))
                Text("Books").font(.system(size: 26))
            }
            
        }.accentColor(Color("Color"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var selected = "Games"
    @State var results: [Result] = []
    
    var body : some View{
        //            List(results) { user in
        //
        //                Text(user.title)
        //                        .font(.headline)
        //                Text(user.posterPath)
        //                        .font(.subheadline)
        //            }
        //                .onAppear {
        //                    apiCall().getUsers { (users) in
        //                        self.results = users
        //                    }
        //                }
        //        }
        //        List(results) { result in
        VStack(spacing: 2){
            
            HStack{
                
                Text("Game Store").fontWeight(.heavy).font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
            }.padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack{
                        
                        ForEach(scorlllist,id: \.self){i in
                            
                            Button(action: {
                                
                                self.selected = i
                                
                            }) {
                                
                                Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                                    
                                    Capsule()
                                        .fill(self.selected == i ? Color.green : Color.clear)
                                        .frame(height: 2)
                                        .padding(.top, 30)
                                    
                                )
                            }
                        }
                    }
                    Divider()
                }
            }
            
            HStack(spacing: 5){
                
                if #available(iOS 14.0, *) {
                    Text("  Discover recommended games").fontWeight(.medium).font(.title3)
                } else {
                    Text("  Discover recommended games")
                }
                
                Spacer()
                Image(systemName: "arrow.forward")
                
            }.padding(.vertical, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                middleView()
                adsView()
            }
            
            
        }.padding()
    }
}

struct App : View {
    
    @State var selected = "Games"
    
    var body : some View{
        
        VStack(spacing: 2){
            
            HStack{
                
                Text("Game Store").fontWeight(.heavy).font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
            }.padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack{
                        
                        ForEach(scorlllist,id: \.self){i in
                            
                            Button(action: {
                                
                                self.selected = i
                                
                            }) {
                                
                                Text(i).padding().foregroundColor(self.selected == i ? Color.black : Color.gray).overlay(
                                    
                                    Capsule()
                                        .fill(self.selected == i ? Color.green : Color.clear)
                                        .frame(height: 2)
                                        .padding(.top, 30)
                                    
                                )
                            }
                        }
                    }
                    Divider()
                }
            }
            
            HStack(spacing: 5){
                
                if #available(iOS 14.0, *) {
                    Text("  Recommended for you").fontWeight(.medium).font(.title3)
                } else {
                    Text("  Recommended for you")
                }
                
                Spacer()
                Image(systemName: "arrow.forward")
                
            }.padding(.vertical, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                topView()
                adsView()
                financialView()
            }
            
            
        }.padding()
    }
}

struct middleView : View {
    
    @State var show = false
    
    var body : some View{
        
        VStack(spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    ForEach(lowlist){i in
                        VStack(alignment: .leading,spacing: 8){
                            Image(i.image).resizable()
                                .frame(width: 220.0, height: 100.0).cornerRadius(10)
                            HStack{
                                
                                Image(i.image).resizable()
                                    .frame(width: 50.0, height: 50.0).cornerRadius(8)
                                VStack(alignment: .leading,spacing: 6){
                                    Text(i.name).font(Font.system(size: 15).bold())
                                    Text("Action - en").foregroundColor(Color.gray).font(Font.system(size: 12).bold())
                                    Text(i.price).foregroundColor(Color.gray).font(Font.system(size: 12).bold()) + Text(" ★ 32MB").foregroundColor(Color.gray).font(Font.system(size: 12).bold())
                                }
                            }
                        }
                    }
                }
                
            }.padding(.vertical, 15)
            
        }
    }
}


struct topView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment:.leading,spacing: 8){
                            
                            Image(i.image).renderingMode(.original)
                            Text(i.name).font(Font.system(size: 15).bold())
                            Text(i.price).foregroundColor(Color.gray).font(Font.system(size: 12).bold())
                        }
                    }
                }
                
            }
        }
    }
}



struct adsView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                
                Text("Ads")
                    .font(Font.system(size: 15).bold()) + Text(" Suggested for you")
                Spacer()
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment:.leading,spacing: 8){
                            
                            Image(i.image).renderingMode(.original)
                            Text(i.name).font(Font.system(size: 15).bold())
                            Text(i.price).foregroundColor(Color.gray).font(Font.system(size: 12).bold())
                        }
                    }
                }
                
            }
        }
    }
}

struct financialView : View {
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                if #available(iOS 14.0, *) {
                    Text("  Financial planning").fontWeight(.medium).font(.title3)
                } else {
                    Text("  Financial planning")
                }
                
                Spacer()
                Image(systemName: "arrow.forward")
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack{
                    
                    ForEach(bottomlist){i in
                        
                        VStack(alignment:.leading,spacing: 8){
                            
                            Image(i.image).renderingMode(.original)
                            Text(i.name).font(Font.system(size: 15).bold())
                            Text(i.price).foregroundColor(Color.gray).font(Font.system(size: 12).bold())
                        }
                    }
                }
                
            }
        }
    }
}

// I already implemented sample data....

var scorlllist = ["For you","Top charts","Categories","Editors choice","Events","Premium","Kids"]

struct type : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

var lowlist = [type(id: 0, name: "Tiny Guardians", price: "2.4",image: "s1"),
               type(id: 1, name: "Kingdom Rush", price: "2.4",image: "s2"),
               type(id: 2, name: "Dragon Heroes", price: "2.4",image: "s3"),
               type(id: 3, name: "War Of Crown", price: "2.4",image: "s1")]

var bottomlist = [type(id: 0, name: "Tiny Guardians", price: "2.4",image: "h1"),
                  type(id: 1, name: "Kingdom Rush", price: "2.4",image: "h2"),
                  type(id: 2, name: "Dragon Heroes", price: "2.4",image: "h3"),
                  type(id: 3, name: "War Of Crown", price: "2.4",image: "h4")]
