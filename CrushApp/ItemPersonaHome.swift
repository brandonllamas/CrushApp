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
    
    @ObservedObject var viewModel = ItemPersonHomeViewModel();
    
    @EnvironmentObject var navigation:NavigationStack
    
    
    init(user:GeneralUsuario) {
        self.users = user;
        self.idss = String(self.users.id);
        self.urlImage = "\( Connections.url_photo)/\(idss)/\(self.users.image!.name)";
    }
    
    var body: some View {
        
        VStack{
          
            ImageWeb(url: self.urlImage, placeHolder: "defaultBoy")
                .scaleEffect()
                .cornerRadius(10)
                .frame(width: 158, height: 224, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top,8)
             
            Text(self.users.contact?.name ?? "No name")
                .bold()
                .foregroundColor(.black)
            
        }
    }
    
}

struct ItemPersonaHome_Previews: PreviewProvider {
    static var previews: some View {
        let userExample:UserHome = UserHome(name: "Hola", iconImagenActivate: "defaultBoy", index: 1, id: 1)
       
    }
}
