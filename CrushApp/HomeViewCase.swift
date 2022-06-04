//
//  HomeViewCase.swift
//  CrushApp
//
//  Created by WebAuxiliar on 18/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class HomeViewCase : ObservableObject {
    
    
    init() {
        
    }
    
    func blockUser(phone:String, name:String,
                   onSuccess200: @escaping(_ resData:GeneralResponseBlock)->Void,
                   onDefault: @escaping(_ resData:GeneralResponseBlock)->Void,
                   onError: @escaping(_ error:String)->Void) {
        
        ServiceHomeView().blockUser(phone: phone, name:name, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
    }
    
    func ListApp(phones:[PhoneItemRequest],
                 currentIndex: Int,
               onSuccess200: @escaping(_ resData:GeneralResponseUserList)->Void,
               onDefault: @escaping(_ resData:GeneralResponseUserList)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        ServiceHomeView().getUserListApp(phones: phones,currentIndex: currentIndex ,onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
       
    }
    
    
    func InsertListApp(phones:[PhoneItemRequest] ,
               onSuccess200: @escaping(_ resData:GeneralResponseUserList)->Void,
               onDefault: @escaping(_ resData:GeneralResponseUserList)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        ServiceHomeView().InsertUserListApp(phones: phones, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
 
    }
    
    
    func saveCellphone(cellphone:String , indicative:String){
        KeyChain.saveCredentials(cellphone: cellphone, indicative: indicative)
    }

}
