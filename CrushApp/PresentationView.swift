//
//  PresentationView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 2/04/22.
//

import SwiftUI

struct PresentationView: View {
    @ObservedObject var viewmodel:PresentationViewModel
    @EnvironmentObject var navigation:NavigationStack
    
    init(){
        self.viewmodel = PresentationViewModel()
    }
    var body: some View {
        
          ZStack{
              degradado
              texto
          }
    }
    
    var degradado:some View{
        LinearGradient(gradient: Gradient(colors: [
            Color("SoftGradient4"),
            Color("SoftGradient3"),
            Color("SoftGradient2"),
            Color("SoftGradient1")
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
    
    var texto:some View{
        VStack(){
            HStack(){
                Spacer()
                Image("Group 35logowithe")
                Spacer()
            }
            HStack(spacing:100){
                Text("Haz match con tu CRUSH")
                    .bold().foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.padding(.top,60)
            HStack(spacing:80){
                Image("line")
            }.padding(.top,5)
            HStack{
                Text("Descubre a cuál de tus contactos le gustas, y quien quisiera salir contigo. Invita a tu crush, o dile que le gustas.No seas tímido, él o ella no lo sabrán, a menos que sientan lo mismo por tí.").bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
            }.padding(.horizontal,40)
            .padding(.top,60)
            
           
            HStack{
                Button(action: {
                   //	 self.viewmodel.aceptarTerminos(nav: navigation)
                    self.navigation.advance(AnyView(LoginView()), tag: .Login)
                }, label: {
                    Text("Continuar")
                })
                
                .buttonStyle(greenButtonDefault())
              
            }.padding(.top,45)
                Spacer()
        }.padding(.top, 140)
    }

}

struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
