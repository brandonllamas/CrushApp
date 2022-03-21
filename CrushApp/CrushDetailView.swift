//
//  CrushDetailView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import SwiftUI

struct CrushDetailView: View {
    var users:GeneralUsuario;
    var urlImage:String = "";
    var idss:String = "";
   @State var alertRating:Bool = false;
    @State var alertButtonCrush:Bool = false;
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(user:GeneralUsuario) {
        self.users = user;
        
        self.idss = String(self.users.id);
        self.urlImage = "\( Connections.url_photo)/\(idss)/\(self.users.image!.name)";
    }
    
    var body: some View {
        Color(.white).ignoresSafeArea()
            .overlay(
                ScrollView{
                    VStack{
                        imagenPeople
                        Text(self.users.contact?.name ?? "no name").padding()
                            .font(.system(size: 20, weight: .bold, design: .default))
                        botomCrush
                        galeria
                        Spacer()
                    }
                }
          )
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .customDialog(isShowing: self.$alertRating){
                DialogCalificate
             }
            .customDialog(isShowing: self.$alertButtonCrush){
                DialogAcction
            }
        
 
        
    }
    
    
    var DialogAcction:some View{
        VStack{
            Text("hi").bold().foregroundColor(.white)
        }
    }
    
    
    var DialogCalificate:some View{
        VStack {
            Text("Califica foto de perfil de \(self.users.contact?.name ?? "no name")")
                  .padding(.bottom, 10)
            Divider()
            HStack{
                Button(action: {
                    self.alertRating = false
                }) {
                  Text("Close dialog")
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
                
                Button(action: {
                    self.alertRating = false
                }) {
                  Text("Acept")
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
            }
              }.padding()
    }
    
    
    var imagenPeople:some View{
        HStack{
            ZStack{
                ImageWeb(url: self.urlImage, placeHolder: "defaultBoy")
                    .scaleEffect()
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
                                    ).onTapGesture {
                                        self.alertRating.toggle()
                                       
                                    }
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
                        Image("DefaultBoy")
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
       // CrushDetailView(user: userExample)
    }
}
