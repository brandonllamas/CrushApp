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
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec turpis erat, rhoncus consequat tellus nec, imperdiet elementum magna Mauris id lacus finibus, mattis justo sed, tempor magna. Aliquam varius tortor ac sagittis laoreet. Sed interdum nisi sed luctus cursus. Curabitur ac ipsum nec ex ultricies feugiat nec eu mi.Pellentesque ultricies eros vitae lacus egestas malesuada. Vivamus tempor ultricies consectetur. Cras bibendum nisl id tincidunt finibus. Sed gravida a urna vitae dignissim. Sed in purus sit amet leo gravida facilisis. Morbi a pharetra nisi. Sed velit arcu, iaculis ac enim suscipit, commodo congue velit. Duis ac orci lectus. Aliquam lobortis nulla elementum augue vestibulum, vel pharetra lacus ultrices. Mauris accumsan ultrices porttitor.").bold()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    
            }.padding(.horizontal,50)
            .padding(.top,20)
            
            HStack{
                if(self.viewmodel.acept){
                    
                    
                    Circle()
                        .strokeBorder(Color.white, lineWidth: 2)
                        .background(Circle().fill(Color("Cian")))
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
            
                    
                
                Text("Acepto los Términos y Condiciones")
                    .foregroundColor(.white)
                    .bold()
            }.padding(.top,50)
            
            HStack{
                Button(action: {
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
