//
//  ItemPersonaHome.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import SwiftUI
import UIKit

struct ItemPersonaHome: View {
    var users:GeneralUsuario;
    var urlImage:String = "";
    var idss:String = "";
    @State var block:Bool = false;
    
    @ObservedObject var viewModel = ItemPersonHomeViewModel();
    
    @EnvironmentObject var navigation:NavigationStack
     var nume:Int;
    
    init(user:GeneralUsuario ,num:Int) {
        self.users = user;
        print(user)
        self.idss = String(self.users.id);
     
        if(self.users.image != nil){
            self.urlImage = "\( Connections.url_photo)/\(idss)/\(self.users.image!.name ?? "")";
        }else{
            self.urlImage = "\( Connections.url_photo)/\(idss)/\("")";
        }
        self.nume = num;
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 6){
            if(!block){
                ZStack{
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: self.urlImage)) { image in
                            image.resizable()
                                .frame(width: 158, height: 224)
                        } placeholder: {
                            Image("Vectorplaceholder")
                                .frame(width: 158, height: 224)
                        }
                    } else {
                        ImageWeb(url: self.urlImage, placeHolder: "Vectorplaceholder")
                            .scaleEffect()
                            .frame(width: 158, height: 224, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                
                }//: ZSTACK
                .cornerRadius(12)
                //NAME
                HStack{
                    Text(self.users.contact?.name ?? "No name")
                        .bold()
                        .foregroundColor(.black)
                
                    Button(action: {
                        print("Bloquear")
                        self.viewModel.block(id: self.users.id)
                        self.block = true;
                    }, label: {
                        Image("md-eye-off")
                            .resizable()
                            .frame(width: 11, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                }
            }
        }.padding(.top,(self.nume % 2 != 0 ? 100 :0))
    }
    
}

struct ItemPersonaHome_Previews: PreviewProvider {
    static var previews: some View {
        let userExample:UserHome = UserHome(name: "Hola", iconImagenActivate: "defaultBoy", index: 1, id: 1)
       
    }
}
