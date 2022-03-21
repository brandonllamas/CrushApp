//
//  SplashScreenView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewmodel:ViewModelSplashScreen
    @EnvironmentObject var navigation:NavigationStack
    
    init() {
        self.viewmodel = ViewModelSplashScreen()
    }
    
  
    
    var body: some View {
      
        ZStack{
            degradado
            logoFondo
            logoNormal
           
        }.onAppear(){
            self.viewmodel.login(nav: self.navigation)
        }
        
        
    }
    var botton: some View{
        Button(action: {
            //self.viewmodel.login(nav: navigation)
        }, label: {
            Text("ingresar")
        })
    }

    var degradado:some View{
        LinearGradient(gradient: Gradient(colors: [
            Color("Cian"),
            Color("AzulDegradado"),
            Color("Magneta")
           
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }



    var logoFondo:some View{
        
        VStack{
            HStack{
                Spacer()
                Image("MedioLogo")
            }
        
        }.frame(width: .infinity, height: .infinity, alignment: .leading)
    }

    var logoNormal:some View{
        VStack{
            Image("LogoWithe")
                .frame(width: 200, height: 200, alignment: .center)
                .onTapGesture {
                    self.viewmodel.login(nav: navigation)
                }
            
        }
    }

}



struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
