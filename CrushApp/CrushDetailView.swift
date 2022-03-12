//
//  CrushDetailView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import SwiftUI

struct CrushDetailView: View {
    var users:UserHome;
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(user:UserHome) {
        self.users = user;
    }
    
    var body: some View {
        Color(.white).ignoresSafeArea()
            .overlay(
                ScrollView{
                    VStack{
                        imagenPeople
                        Text(self.users.name).padding()
                            .font(.system(size: 20, weight: .bold, design: .default))
                        botomCrush
                        galeria
                        Spacer()
                    }
                }
          )
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
       
        
 
        
    }
    
    var imagenPeople:some View{
        HStack{
            ZStack{
                Image(self.users.iconImagenActivate)
                    .resizable()
                    .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(16)
                    .overlay(
                        VStack{
                            HStack{
                                //Text("hii2")
                                Spacer()
                                Image("warning")
                                    .onTapGesture {
                                        print("hi")
                                    }
                            }
                            .padding()
                            Spacer()
                            HStack{
                                Spacer()
                                //Text("hii")
                                Rectangle()
                                    .overlay(
                                        HStack{
                                            Image("Vectorstartwe")
                                        }
                                    )
                                    
                                    .cornerRadius(20, corners: [.topLeft,.bottomRight])
                                    .frame(width: 62, height: 38, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color("Degradado"))
                                
                                    
                            }
                        }
                    )
                
            }
        }.frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.horizontal,44)
    }
    
    var galeria: some View{
        VStack{
            HStack{
                Text("Galeria")
                Spacer()
            }.padding()
           
               
            HStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<8) {_ in
                        Image(self.users.iconImagenActivate)
                            .resizable()
                            .frame(width: 106, height: 121, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                 }.padding(.horizontal)
            }
        }
    }
    
    
    var botomCrush:some View{
        HStack{
            Button(action: {
               print("crush")
            }, label: {
                Text("Crush")
            })
            
            .buttonStyle(crushButtonDefault())
          
        }
    }
}

struct CrushDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userExample:UserHome = UserHome(name: "Darkmoon", iconImagenActivate: "defaultBoy", index: 1, id: 1)
        CrushDetailView(user: userExample)
    }
}
