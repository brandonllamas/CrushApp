//
//  MainNavigationView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI
import UIKit

struct MainNavigationView: View {
    @ObservedObject var viewmodel:ViewModelNavigation
    @EnvironmentObject var navigation:NavigationStack
    
    init(){
        self.viewmodel = ViewModelNavigation()
    }
   
    var body: some View {
        VStack{
            toolBar
            vistas
            Spacer()
            
            bottomNavigation
            /*
            TabView{
                HomeView().tabItem { Label("Inicio", systemImage: "house") } .cornerRadius(90, corners: [.topLeft,.topRight])
                FotosView().tabItem { Label("Fotos", systemImage: "house") }
                CrushView().tabItem { Label("Crush", systemImage: "house") }
                SettingsView().tabItem() { Label("Inicio", systemImage: "house") }.accentColor(.red) .cornerRadius(90, corners: [.topLeft,.topRight])
                
            }
            .accentColor(Color("SoftGradient1"))
            */
        }.frame(width: .infinity, height: .infinity)
        .background(Color("BackGroundVistas"))
      
        
    }
    var toolBar:some View{
        HStack{
            
        }.background(Color(.white))
    }
    var vistas:some View{
        ZStack{
            switch self.viewmodel.indexSel{
            case 0 :
                HomeView()
            case 1:
                FotosView()
            case 2 :
                CrushView()
            case 3 :
                SettingsView()
            default:
            HomeView()
            
            }
        }
    }
    
    var bottomNavigation:some View{
        HStack{
            ForEach(self.viewmodel.option){ option in
                Spacer()
                Button(action: {
                    self.viewmodel.indexSel = option.index
                }, label: {
                    
                    VStack{
                        Image(option.index == self.viewmodel.indexSel ? option.iconImagenActivate : option.iconImagen)
                            .font(.system(size: 24 ,weight:.bold))
                        Text(option.name).foregroundColor(option.index == self.viewmodel.indexSel ? Color("SoftGradient1") : .gray).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }.padding(.top,5)
                })
                Spacer()
                
            }
        }.background(Color(.white))
        .cornerRadius(50, corners: [.topLeft,.topRight])
        
    }
    
    
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}







struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}