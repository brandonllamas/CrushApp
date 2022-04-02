//
//  SettingsView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI

struct SettingsView: View {
    
    let columns = [
        
        GridItem(.flexible(),spacing: 5),
        GridItem(.flexible() ,spacing: 10),
    ]
    
    @ObservedObject var viewmodel:ViewModelSetting;
    @EnvironmentObject var navigation:NavigationStack
    
    init(){
        self.viewmodel = ViewModelSetting()
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                InvitarAmigos.padding()
                optionUserBlock.padding()
                optionCerrarSeccion.padding()
                Spacer()
            }
        }
    }
    
    
    
    var optionCerrarSeccion: some View{
        VStack(alignment:.leading){
            HStack{
                Image("close").resizable()
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Cerrar Sesion")
            }
            Rectangle().frame(width: 357, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal"))
        }.onTapGesture {
            self.viewmodel.ExitSection(nav:self.navigation)
        }
    }
    
    var InvitarAmigos: some View{
        VStack(alignment:.leading){
            HStack{
                Image("Vectorinvitarfriend").resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.viewmodel.InvitarAmigos ? Color("SoftGradient1") : .gray)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Invitar Amigos")
                    .foregroundColor(self.viewmodel.InvitarAmigos ? Color("SoftGradient1") : .gray)
                Spacer()
                if(self.viewmodel.InvitarAmigos){
                    Image("openSet").resizable().frame(width: 16, height: 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    Image("closeSet").resizable().frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal,27)
            .onTapGesture {
                self.viewmodel.InvitarAmigos = !self.viewmodel.InvitarAmigos
                //self.viewmodel.getUserBlock()
            }
        
            Rectangle().frame(width: 357, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal"))
                .padding(.horizontal,27)
               
            if(self.viewmodel.InvitarAmigos  ){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        Image("Vectorinvitarfriend").resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 27, height: 27, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/); Text("Enviar invitación por SMS").foregroundColor(.white)
                    }
                }).buttonStyle(btnSmsConf())
                .padding(.horizontal,37)
                 
            }
        }
    }

    
    var optionUserBlock: some View{
        VStack(alignment:.leading){
            HStack{
                Image("Vectoruserblock").resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.viewmodel.verUsuario ? Color("SoftGradient1") : .gray)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Usuario Bloqueado")
                    .foregroundColor(self.viewmodel.verUsuario ? Color("SoftGradient1") : .gray)
                Spacer()
                if(self.viewmodel.verUsuario){
                    Image("openSet").resizable().frame(width: 16, height: 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    Image("closeSet").resizable().frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal,27)
            .onTapGesture {
                self.viewmodel.verUsuario = !self.viewmodel.verUsuario
                self.viewmodel.getUserBlock()
            }
        
            Rectangle().frame(width: 357, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal"))
                .padding(.horizontal,27)
               
            if(self.viewmodel.verUsuario  ){
                Text("Usuarios Bloqueados").padding(.horizontal,27)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.viewmodel.userBlock, id: \.self) { homePeople in
                     
                        
                        ItemPersonaHome(user: homePeople.user_blocked)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
