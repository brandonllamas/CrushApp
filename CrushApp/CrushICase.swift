//
//  CrushICase.swift
//  CrushApp
//
//  Created by WebAuxiliar on 28/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class CrushICase : ObservableObject {
    
    
    init() {
        
    }
    
    
    func getMachList(
               onSuccess200: @escaping(_ resData:GeneralResponseMachList)->Void,
               onDefault: @escaping(_ resData:GeneralResponseMachList)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        
        CrushService().getMachList(onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
    }
    
    
    func saveCellphone(cellphone:String , indicative:String){
        KeyChain.saveCredentials(cellphone: cellphone, indicative: indicative)
    }

}
