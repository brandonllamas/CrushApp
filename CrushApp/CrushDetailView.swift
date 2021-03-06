//
//  CrushDetailView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import SwiftUI

struct CrushDetailView: View {
    var users:GeneralUsuario;
   @State var urlImage:String = "";
   var idss:String = "";
   @State var name:String;
   @ObservedObject var viewModel:ViewModelCrushDetail;
    
   @State var alertRating:Bool = false;
   @State var alertButtonCrush:Bool = false;
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    init(user:GeneralUsuario, contact:[PhoneItemRequest]) {
        self.users = user;
        self.viewModel = ViewModelCrushDetail(id:users.id, user:users,contact:contact)
        if(contact.count > 0){
            self.name = contact[user.i ?? 0].name
        } else {
            self.name = user.name ?? ""
        }
        self.idss = String(user.id)
    }
    
    var body: some View {
        Color(.white).ignoresSafeArea()
            .overlay(
                ScrollView{
                    VStack{
                        imagenPeople
                        Text(self.users.contact?.name ?? self.name).padding()
                            .font(.system(size: 20, weight: .bold, design: .default))
                        botomCrush
                        galeria
                        Spacer()
                    }.onAppear(){
                        self.viewModel.detail()
                        self.viewModel.getActions()
                        self.viewModel.getRating()
                        //self.idss = String(self.users.id)
                        if(self.users.image != nil){
                            self.urlImage = "\( Connections.url_photo)/\(self.users.id)/\(self.users.image!.name )";
                        }else{
                            self.urlImage = "\( Connections.url_photo)/\(self.users.id)/\("nopho")";
                        }
                        print(self.urlImage + "FOTO DETALLE GG")
                       
                    }
                }
                
          )
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            .customDialog(isShowing: self.$alertRating){
                DialogCalificate.background(Color(.white))
                    .cornerRadius(40)
             }
            .CustomDialogNofondo(isShowing: self.$alertButtonCrush){
                DialogAcction
            }
            .CustomDialogFondoWite(isShowing: self.$viewModel.load){
                loading
            }
        
    }
    
    var loading:some View{
        VStack{
            HStack{
                DotView() // 1.
                DotView(delay: 0.2) // 2.
                DotView(delay: 0.4) // 3.
            }
        }
    }
    
    
    var DialogAcction:some View{
        VStack{
            Spacer()
            Text(self.users.contact?.name ?? self.name)
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
                            .buttonStyle(btnDialogDetailGradient())
                        }else{
                            Button(action: {
                               print("crush")
                                self.viewModel.addActionM(action: action.id)
                                self.viewModel.fbAnalitycs(cadena: action.name)
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
                    .buttonStyle(btnDialogDetailClose())
                    .padding(.top, 12)
                }
                Spacer()
            }
        }.frame(width: .infinity, height: .infinity, alignment: .center)
    }
    
    
    var DialogCalificate:some View{
        VStack {
            Text("Califica foto de perfil de \(self.users.contact?.name ?? self.name)")
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
                ImageWeb(url: self.urlImage, placeHolder: "usernoimage")
                    .scaledToFit()
                    .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        ImageWeb(url: self.urlImage, placeHolder: "usernoimage")
                            .scaledToFill()
                            .blur(radius: 5)
                            .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
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
                                    .cornerRadius(14, corners: [.topLeft,.bottomRight])
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
            }.padding(.horizontal,40)
           
               
            HStack{
                LazyVGrid(columns: columns, spacing: 20) {
                     
                    ForEach(self.viewModel.images, id: \.self){ images in
                        var p:String = "\( Connections.url_photo)/\(self.users.id)/\(images.name)"
                        ImageWeb(url: "\( Connections.url_photo)/\(self.users.id)/\(images.name)", placeHolder: "usernoimage")
                                .scaledToFit()
                                .frame(width: 106, height: 121, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(
                                    ImageWeb(url: p, placeHolder: "usernoimage")
                                        .scaledToFill()
                                        .blur(radius: 5)
                                        .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                )                                .cornerRadius(12)
                      
                        }
                    
                    
                   
                 }.padding(.horizontal,40)
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
