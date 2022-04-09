//
//  ViewModelSetting.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelSetting:ObservableObject{
   
    @Published var verUsuario:Bool = false;
    @Published var InvitarAmigos:Bool = false;
    @Published var politicst:Bool = false;
    
    
    @Published var userBlock:[DataUsertBlock] = [];
    @EnvironmentObject var navigation:NavigationStack
    
    
    init() {
        getUserBlock();
    }
    
    func getUserBlock() {
        SettingUserCase().getUsersBlock(){ response in
            self.userBlock = response.data;
           print(response)
            
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }
    
    func ExitSection(nav:NavigationStack){
        SettingUserCase().saveCellphone(cellphone: "", indicative: "")
        nav.advance(AnyView(SplashScreenView()), tag: .SplashScreen)
         
    }

}
