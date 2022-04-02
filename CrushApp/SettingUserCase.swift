//
//  SettingUserCase.swift
//  CrushApp
//
//  Created by WebAuxiliar on 30/03/22.
//
//
import Foundation
import SwiftUI
import Alamofire


class SettingUserCase : ObservableObject {
    
    
    init() {
        
    }
    
    func getUsersBlock(
                   onSuccess200: @escaping(_ resData:DataUserListBlock)->Void,
                   onDefault: @escaping(_ resData:DataUserListBlock)->Void,
                   onError: @escaping(_ error:String)->Void) {
        
        SettingsServices().getUserListApp(onSuccess200: onSuccess200, onDefault: onDefault, onError: onError)
    }
    
    func saveCellphone(cellphone:String , indicative:String){
        //KeyChain.saveCredentials(cellphone: cellphone, indicative: indicative)
        LocalStorage.save(value: cellphone, key: "cellphone")
        LocalStorage.save(value: indicative, key: "indicative")
    }

}
