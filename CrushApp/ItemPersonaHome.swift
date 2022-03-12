//
//  ItemPersonaHome.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import SwiftUI

struct ItemPersonaHome: View {
  var users:UserHome;
    @ObservedObject var viewModel = ItemPersonHomeViewModel();
    
    @EnvironmentObject var navigation:NavigationStack
    
    
    init(user:UserHome) {
        self.users = user;
    }
    
    var body: some View {
        VStack{
            
            Image(self.users.iconImagenActivate)
                .resizable()
                .cornerRadius(10)
                .frame(width: 158, height: 224, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top,8)
            Text(self.users.name)
                .bold()
                .foregroundColor(.black)
            
        }
    }
    
}

struct ItemPersonaHome_Previews: PreviewProvider {
    static var previews: some View {
        let userExample:UserHome = UserHome(name: "Hola", iconImagenActivate: "defaultBoy", index: 1, id: 1)
        ItemPersonaHome(user: userExample)
    }
}
