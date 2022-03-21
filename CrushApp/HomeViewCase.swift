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
    
    
    func ListApp(phones:[PhoneItemRequest] ,
               onSuccess200: @escaping(_ resData:GeneralResponseUserList)->Void,
               onDefault: @escaping(_ resData:GeneralResponseUserList)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        ServiceHomeView().getUserListApp(phones: phones, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
       
    }
    
    
    func saveCellphone(cellphone:String , indicative:String){
        KeyChain.saveCredentials(cellphone: cellphone, indicative: indicative)
    }

}
