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
    
    func inviteFriends(){
        
        let urlString = "Hola! Descargué esta app y esta genial. Te la recomiendo mucho. Me gustaría que la descargaras también.    https://www.instagram.com/mycrushbycrush/?hl=es-la"
        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let url  = NSURL(string: "whatsapp://send?text=\(urlStringEncoded!)")

   //Text which will be shared on WhatsApp is: "Hello Friends, Sharing some data here... !"

        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:]) { (success) in
                   if success {
                       print("WhatsApp accessed successfully")
                   } else {
                       print("Error accessing WhatsApp")
                   }
               }
       }
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
