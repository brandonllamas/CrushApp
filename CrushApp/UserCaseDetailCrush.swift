//
//  UserCaseDetailCrush.swift
//  CrushApp
//
//  Created by WebAuxiliar on 21/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class UserCaseDetailCrush : ObservableObject {
    
    
    init() {
        
    }
    
    
    func addAction(id_user:Int ,id_action:Int,
                   onSuccess200: @escaping(_ resData:GeneralResponseActionsAsign)->Void,
                   onDefault: @escaping(_ resData:GeneralResponseActionsAsign)->Void,
                   onError: @escaping(_ error:String)->Void)  {
        CrushDetailService().AsignAction(id_user: id_user,id_action:id_action, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
        }
    
    func GetDetailUser(ids:Int ,
               onSuccess200: @escaping(_ resData:GeneralDetailCrushResponse)->Void,
               onDefault: @escaping(_ resData:GeneralDetailCrushResponse)->Void,
               onError: @escaping(_ error:String)->Void)  {
        CrushDetailService().getDetailCrush(id: ids, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
    }
    
    
    
    func GetActionsList(
               onSuccess200: @escaping(_ resData:GeneralResponseActions)->Void,
               onDefault: @escaping(_ resData:GeneralResponseActions)->Void,
               onError: @escaping(_ error:String)->Void)  {
         
        CrushDetailService().getListAction(onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
    }

}
