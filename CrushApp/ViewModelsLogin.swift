//
//  ViewModelsLogin.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import Firebase
import SwiftUI

class ViewModelLogin:ObservableObject{
    var serviceLofgin:LoginService = LoginService();
    @Published var indicativos:[Indicative]  = [];
    @Published var indicativoSel:Indicative? = nil;
    
     var loading:Bool = false;
    @Published var codeSend:Bool = false;
    @Published var codeSending:String = "";
    @Published var cellphone:String = "";
    @Published var msgError:String = "";
    
    init() {

    }
    
    func login(indicative:String,cellphone:String,nav:NavigationStack){
        self.loading = true
        if cellphone.isEmpty {
            self.msgError = "campos vacio"
            self.loading = false
            return
        }
        LoginService().login(cellphone: cellphone, indicative: indicative)
        { response in
            
            DataApp.authUser = response.data
            DataApp.user = response.data.user
            LoginService().saveCellphone(cellphone: cellphone, indicative: indicative)
            nav.advance(AnyView(MainNavigationView()), tag: .MainNavigation)
            self.loading = false
           print(response)
            
        } onDefault: { response in
            self.loading = false
            print(response)
            
        } onError: { error in
            self.loading = false
            print(error)
            
        }
  }
    
    
    
    
    func getIndicativesView()  {
        LoginService().listIndicatives(){ response in
            
            self.indicativos = response.data.data;
            
        } onDefault: { response in
            
            print(response)
            
        } onError: { error in
            
            print(error)
            
        }
    }
    
    func sendCode(indicative:String,cellphone:String){
        PhoneAuthProvider.provider()
            .verifyPhoneNumber("+573045703711", uiDelegate: nil) { verificationID, error in
              if let error = error {
               // self.showMessagePrompt(error.localizedDescription)
                return
              }
                print("EL VERIFICATION ID ES")
                print(verificationID)
                self.msgError = verificationID ?? "no code"
              // Sign in using the verificationID and the code sent to the user
              // ...
          }
    }
    
    
    

}
