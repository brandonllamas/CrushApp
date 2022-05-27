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
                optionHelp.padding()
                politicts.padding()
                optionCerrarSeccion.padding()
                Spacer()
            }
        }.background(Color("BackGroundVistas"))
    }
    
    
    
    var optionCerrarSeccion: some View{
        VStack(alignment:.leading){
            HStack{
                Image("close").resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading, 6)
                Text("Cerrar Sesion").foregroundColor(.gray)
            }
            .padding(.horizontal,27)
            Rectangle().frame(width: .infinity, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal")).padding(.horizontal,20)
        }.onTapGesture {
            self.viewmodel.ExitSection(nav:self.navigation)
        }
    }
    
    var optionHelp: some View{

            Link( destination: URL(string: "https://crushbycrush.com/ayuda")!){
                VStack(alignment:.leading){
                HStack{
                    Image("Helphelp").resizable()
                        .renderingMode(.template)
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.horizontal,1)
                    Text("Ayuda").foregroundColor(.gray)
                    Spacer()
                    Image("closeSet").resizable().frame(width: 16, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal,27)
                Rectangle().frame(width: .infinity, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal")).padding(.horizontal,20)
            }
          
        }
    }
    
    
    var politicts: some View{
        VStack(alignment:.leading){
            HStack{
                Image("politic").resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.viewmodel.politicst ? Color("SoftGradient1") : .gray)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.leading, 4)
                Text("Politica de privacidad y tratamiento de datos personales")
                    .foregroundColor(self.viewmodel.politicst ? Color("SoftGradient1") : .gray)
                Spacer()
                if(self.viewmodel.politicst){
                    Image("openSet").resizable().frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    Image("closeSet").resizable().frame(width: 16, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal,27)
            .onTapGesture {
                self.viewmodel.politicst = !self.viewmodel.politicst
                //self.viewmodel.getUserBlock()
            }
        
            
            Rectangle().frame(width: .infinity, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal")).padding(.horizontal,20)
               
            if(self.viewmodel.politicst  ){
                VStack{
                    Link( destination: URL(string: "https://crushbycrush.com/terminos-os-y-condiciones/")!){
                        HStack{
                            Spacer()
                            Text("Terminos y condiciones").foregroundColor(.black)
                                .bold()
                            Spacer()
                        }.frame(width: .infinity, height: .infinity, alignment: .center)
                    }
                    
                    Link( destination: URL(string: "https://crushbycrush.com/politica-de-tratamiento-de-datos-personales/")!){
                        HStack{
                            Spacer()
                            Text("Politicas de privacidad").foregroundColor(.black)
                                .bold()
                            Spacer()
                        }
                        .padding(.top,5)
                        .frame(width: .infinity, height: .infinity, alignment: .center)
                     
                    }
                }
                 
            }
        }.onTapGesture {
            self.viewmodel.politicst = !self.viewmodel.politicst
            //self.viewmodel.getUserBlock()
        }
    
    }
    
    
    var InvitarAmigos: some View{
        VStack(alignment:.leading){
            HStack{
                Image("Vectorinvitarfriend").resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.viewmodel.InvitarAmigos ? Color("SoftGradient1") : .gray)
                    .frame(width: 34, height: 34, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.leading, 4)
                    .padding(.trailing, 4)
                Text("Invitar Amigos")
                    .foregroundColor(self.viewmodel.InvitarAmigos ? Color("SoftGradient1") : .gray)
                Spacer()
                if(self.viewmodel.InvitarAmigos){
                    Image("openSet").resizable().frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    Image("closeSet").resizable().frame(width: 16, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal,27)
            .onTapGesture {
                self.viewmodel.InvitarAmigos = !self.viewmodel.InvitarAmigos
                //self.viewmodel.getUserBlock()
            }
        
            
            Rectangle().frame(width: .infinity, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal")).padding(.horizontal,20)
               
            if(self.viewmodel.InvitarAmigos  ){
                HStack{
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Spacer()
                            Image("Vectorinvitarfriend").resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 27, height: 27, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/); Text("Enviar invitación").foregroundColor(.white)
                            Spacer()
                           
                        }
                    }).buttonStyle(btnSmsConf())
                    //.padding(.horizontal,37)
                    Spacer()
                }
                 
            }
        }.onTapGesture {
            self.viewmodel.InvitarAmigos = !self.viewmodel.InvitarAmigos
            //self.viewmodel.getUserBlock()
        }
    
    }

    
    var optionUserBlock: some View{
        VStack(alignment:.leading){
            HStack{
                Image("Vectoruserblock").resizable()
                    .renderingMode(.template)
                    .foregroundColor(self.viewmodel.verUsuario ? Color("SoftGradient1") : .gray)
                    .frame(width: 40, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.leading, 6)
                Text("Usuario Bloqueado")
                    .foregroundColor(self.viewmodel.verUsuario ? Color("SoftGradient1") : .gray)
                Spacer()
                if(self.viewmodel.verUsuario){
                    Image("openSet").resizable().frame(width: 16, height: 16, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    Image("closeSet").resizable().frame(width: 16, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal,27)
            .onTapGesture {
                self.viewmodel.verUsuario = !self.viewmodel.verUsuario
                self.viewmodel.getUserBlock()
            }
        
            Rectangle().frame(width: .infinity, height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(Color("textoNormal")).padding(.horizontal,20)
               
            if(self.viewmodel.verUsuario  ){
                Text("Usuarios Bloqueados").padding(.horizontal,27)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.viewmodel.userBlock, id: \.self) { homePeople in
                     
                        
                        ItemPersonaHome(user: homePeople.user_blocked, num: 0, contacts: [] )
                    }
                }
            }
        }  .onTapGesture {
            self.viewmodel.verUsuario = !self.viewmodel.verUsuario
            self.viewmodel.getUserBlock()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
