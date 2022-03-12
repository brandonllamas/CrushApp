//
//  LoginView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        Color("moradologin")
            .ignoresSafeArea()
                .overlay(
                    VStack{
                        HStack{
                            VStack{
                                
                                Image("login")
                                
                            }
                        }.padding(.vertical,100)
                        
                        HStack{
                            vistaLogin
                        }
                    }
              )
                .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               }
    
    var vistaLogin: some View{
        VStack{
            HStack{
                Spacer()
            }
            //Spacer()
            Text("Iniciar Sesión").padding(.top,3)
            Spacer()
        }.background(Color(.white))
        .cornerRadius(50)
        .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
