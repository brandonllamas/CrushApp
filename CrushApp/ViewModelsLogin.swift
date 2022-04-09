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
    
    ///TODO: Datos para verificar
    var tokenVerification:String = "";
    var cellphonetoLogin:String = "";
    var indicativetoLogin:String = "";
    
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
    
    func verificateCOde(code:String,nav:NavigationStack){
        if(!code.isEmpty || !self.cellphonetoLogin.isEmpty || !self.indicativetoLogin.isEmpty){
            self.loading = true
            let loginFire = PhoneAuthProvider.provider().credential(withVerificationID: self.tokenVerification, verificationCode: code)
            
            Auth.auth().signIn(with:loginFire){ uthCompletion,error in
                if let error = error {
                    print("Error creating a new user \(error.localizedDescription)")
                    self.msgError =  error.localizedDescription
                    self.codeSend = false;
                    self.loading = false;
                    self.codeSending = "";
                    return
                }
                
                self.login(indicative:self.indicativetoLogin,cellphone:self.cellphonetoLogin,nav:nav)
                
            }
        }else{
            self.msgError = "Numero mal inresado"
        }
    }
    
    func sendCode(indicative:String,cellphone:String){
        self.loading = true;
        PhoneAuthProvider.provider()
            .verifyPhoneNumber("\(indicative)\(cellphone)", uiDelegate: nil) { verificationID, error in
              if let error = error {
                print("error phone number")
                print(error)
                print("\(indicative)\(cellphone)")
               // self.showMessagePrompt(error.localizedDescription)
                self.msgError = error.localizedDescription
                self.loading = false;
                return
              }
                self.cellphonetoLogin = cellphone
                self.indicativetoLogin = indicative
                
                print("EL VERIFICATION ID ES")
                print(verificationID)
                self.tokenVerification = verificationID ?? ""
                self.codeSend = true;
                self.msgError = "";
                self.loading = false;
              // Sign in using the verificationID and the code sent to the user
              // ...
          }
    }
    
    
    

}
