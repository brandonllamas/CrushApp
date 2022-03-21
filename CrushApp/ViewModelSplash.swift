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
        var Cellphone:String = KeyChain.load(key: "cellphone") ?? ""
        var pwsd:String = KeyChain.load(key: "indicative") ?? ""
        
        if(Cellphone != "" && pwsd != ""){
            LoginService().login(cellphone: Cellphone, indicative: pwsd)
            { response in
                
                DataApp.authUser = response.data
                DataApp.user = response.data.user
                LoginService().saveCellphone(cellphone: pwsd, indicative: Cellphone)
                nav.advance(AnyView(MainNavigationView()), tag: .MainNavigation)
                 
               print(response)
                
            } onDefault: { response in
            
                print(response)
                
            } onError: { error in
                 
                print(error)
                
            }
        }else{
            print("Sin keyns")
            nav.advance(AnyView(LoginView()), tag: .TerminosView)
        }
   
       

    }
}
