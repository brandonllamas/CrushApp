//
//  ViewModelSplash.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import SwiftUI

class ViewModelSplashScreen:ObservableObject{
    var navigation: NavigationStack?
    
    init() {
        
    }
    
    
    
    func login(nav:NavigationStack) {
        self.navigation = nav
        var Cellphone:String = LocalStorage.load(key: "cellphone") 
        var pwsd:String = LocalStorage.load(key: "indicative")
        
         if(Cellphone != "" && pwsd != ""){
    //if(false){
            LoginService().login(cellphone: Cellphone, indicative: pwsd)
            { response in
                
                DataApp.authUser = response.data
                DataApp.user = response.data.user
                LoginService().saveCellphone(cellphone: Cellphone, indicative: pwsd)
                nav.advance(AnyView(MainNavigationView()), tag: .MainNavigation)
                 
               print(response)
                
            } onDefault: { response in
            
                print(response)
                nav.advance(AnyView(LoginView()), tag: .TerminosView)
                
            } onError: { error in
                 
                print(error)
                nav.advance(AnyView(LoginView()), tag: .TerminosView)
                
            }
        }else{
            print("Sin keys")
            nav.advance(AnyView(LoginView()), tag: .TerminosView)
        }
   
       

    }
}
