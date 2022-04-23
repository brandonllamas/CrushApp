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
   @ObservedObject var viewModel:ViewModelCrushDetail;
    
   @State var alertRating:Bool = false;
   @State var alertButtonCrush:Bool = false;
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(user:GeneralUsuario) {
        self.users = user;
        self.viewModel = ViewModelCrushDetail(id:users.id,user:users)
        
        self.idss = String(self.users.id);
        if(self.users.image != nil){
            self.urlImage = "\( Connections.url_photo)/\(idss)/\(self.users.image!.name )";
        }else{
            self.urlImage = "\( Connections.url_photo)/\(idss)/\("nopho")";
        }
        print(self.users.name)
        print(self.users.image)
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
                    }.onAppear(){
                        self.viewModel.detail()
                    }
                }
                .customDialog(isShowing: self.$alertRating){
                    DialogCalificate.background(Color(.white))
                        .cornerRadius(40)
                 }
                .CustomDialogNofondo(isShowing: self.$alertButtonCrush){
                    DialogAcction
                }
          )
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
 
        
    }
    
    
    var DialogAcction:some View{
        VStack{
            Spacer()
            Text(self.users.contact?.name ?? "No name")
                .font(.title)
                .bold()
                .foregroundColor(Color(.white))
                .fontWeight(.medium)
            
            HStack{
                Spacer()
                VStack{
                    
                    ForEach(self.viewModel.AccionesCrush, id: \.self){ action in
                        if(self.viewModel.existAction(idAction: action.id)){
                            Button(action: {
                               print("crush")
                                self.viewModel.RemoveActionM(action: action.id)
                            }, label: {
                                Text(action.name)
                            })
                            .buttonStyle(btnDialogDetailAcept())
                        }else{
                            Button(action: {
                               print("crush")
                                self.viewModel.addActionM(action: action.id)
                            }, label: {
                                Text(action.name)
                            })
                            .buttonStyle(btnDialogDetail())
                        }
                       }
                 
                    
                     
                    
                    Button(action: {
                        self.alertButtonCrush = false;
                    }, label: {
                        Text("Cerrar")
                    })
                    .buttonStyle(btnDialogDetail())
                }
                Spacer()
            }
        }.frame(width: .infinity, height: .infinity, alignment: .center)
    }
    
    
    var DialogCalificate:some View{
        VStack {
            Text("Califica foto de perfil de \(self.users.contact?.name ?? "no name")")
                  .padding(.bottom, 10)
            
                ratingBar
            
            Divider()
            HStack{
                Button(action: {
                    self.alertRating = false
                    self.viewModel.rating = self.viewModel.ratingOriginal
                }) {
                  Text("Cerrar")
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
                
                Button(action: {
                    self.alertRating = false
                    self.viewModel.ratingOriginal = self.viewModel.rating
                    self.viewModel.setRating()
                }) {
                  Text("Aceptar")
                    .foregroundColor(Color(.blue))
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
            }
              }.padding()
    }
    
    
    var ratingBar:some View{
        HStack{
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating >= 7 ? Color.yellow : Color.gray)
                .frame(width: 32, height: 30)
                .padding(.horizontal,5)
                .onTapGesture {
                    self.viewModel.rating = 7
                }
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating >= 8 ? Color.yellow : Color.gray)
                .frame(width: 32, height: 30)
                .padding(.horizontal,5)
                .onTapGesture {
                    self.viewModel.rating = 8
                }
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating == 9 ? Color.yellow : Color.gray)
                .frame(width: 32, height: 30)
                .padding(.horizontal,5)
                .onTapGesture {
                    self.viewModel.rating = 9
                }
            
        }.padding()
    }
    
    
    var imagenPeople:some View{
        HStack{
            ZStack{
                ImageWeb(url: self.urlImage, placeHolder: "Vectorplaceholder")
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
                     
                    ForEach(self.viewModel.images, id: \.self){ images in
                            ImageWeb(url: "\( Connections.url_photo)/\(idss)/\(images.name)", placeHolder: "Vectorplaceholder")
                                .scaleEffect()
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
                self.alertButtonCrush.toggle()
            }, label: {
                Text("Crush")
            })
            
            .buttonStyle(crushButtonDefaultDetail())
          
        }
    }
}

struct CrushDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userExample:UserHome = UserHome(name: "Darkmoon", iconImagenActivate: "defaultBoy", index: 1, id: 1)
       // CrushDetailView(user: userExample)
    }
}
