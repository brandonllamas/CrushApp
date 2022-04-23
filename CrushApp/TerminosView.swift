//
//  TerminosView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI

struct TerminosView: View {
    @ObservedObject var viewmodel:ViewModelTerminos
    @EnvironmentObject var navigation:NavigationStack
    
    init(){
        self.viewmodel = ViewModelTerminos()
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
            HStack(spacing:100){
                Text("Términos y Condiciones")
                    .bold().foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.padding(.top,50)
            HStack(spacing:80){
                Image("line")
            }.padding(.top,10)
            HStack{
                Image("Group 35logowithe")
            }.padding(.horizontal,50)
            .padding(.top,20)
            
            HStack{
                if(self.viewmodel.acept){
                    
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 2)
                        .background(Circle().fill( Color("Cian")) )
                        .onTapGesture {
                            self.viewmodel.acept = !self.viewmodel.acept;
                        }
                        .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }else{
                    
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 2)
                        .background(Circle().fill(Color.white)) 
                        .onTapGesture {
                            self.viewmodel.acept = !self.viewmodel.acept;
                        }
                        .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            
                    
                
                VStack{
                    Text("Acepto el tratamiento  de mis datos personales de a cuerdo a la")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    Link( destination: URL(string: "https://crushbycrush.com/politica-de-tratamiento-de-datos-personales/")!){
                        Text("Politica de privacidad y tratamiento de datos personales")
                            .foregroundColor(.white)
                            .bold()
                            .underline()
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                }
                    
                    Text(" de crush App S.A.S aso como los")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: .infinity, height: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Link( destination: URL(string: "https://crushbycrush.com/terminos-os-y-condiciones/")!){
                        Text("Terminos y condiciones")
                            .foregroundColor(.white)
                            .bold()
                            .underline()
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            
                }
                   
                }
            }.padding(.top,50)
            
            HStack{
                Button(action: {
                    if(!self.viewmodel.acept){return}
                    self.viewmodel.aceptarTerminos(nav: navigation)
                }, label: {
                    Text("Continuar")
                })
                
                .buttonStyle(greenButtonDefault())
              
            }.padding(.top,20)
                Spacer()
        }
    }
    
    
    
}

struct TerminosView_Previews: PreviewProvider {
    static var previews: some View {
        TerminosView()
    }
}
