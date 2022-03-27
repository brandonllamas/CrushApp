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
    
    func removeUnmacht(id_user:Int ,id_action:Int,
                   onSuccess200: @escaping(_ resData:GeneralMachRemove)->Void,
                   onDefault: @escaping(_ resData:GeneralMachRemove)->Void,
                   onError: @escaping(_ error:String)->Void)  {
        CrushDetailService().RemoveAction(id_user: id_user,id_action:id_action, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
        }
    
    func getRatinDetail(id_photo:Int,
                   onSuccess200: @escaping(_ resData:GeneralRating)->Void,
                   onDefault: @escaping(_ resData:GeneralRating)->Void,
                   onError: @escaping(_ error:String)->Void)  {
        CrushDetailService().getRatingBar(id: id_photo, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
        }
    
    func SettRatinDetail(id_photo:Int,value:Int,
                   onSuccess200: @escaping(_ resData:SetGeneralRating)->Void,
                   onDefault: @escaping(_ resData:SetGeneralRating)->Void,
                   onError: @escaping(_ error:String)->Void)  {
        CrushDetailService().SettRatingBar(id: id_photo,Value:value, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
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
