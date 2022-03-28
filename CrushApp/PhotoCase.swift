//
//  PhotoCase.swift
//  CrushApp
//
//  Created by WebAuxiliar on 27/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class PhotoCase : ObservableObject {
    
    
    init() {
        
    }
    
    
    func UploadPhoto(image:String,
               onSuccess200: @escaping(_ resData:UploadPhotoResponse)->Void,
               onDefault: @escaping(_ resData:UploadPhotoResponse)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        PhotoService().UploadPhoto(image: image, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
    }
    
    func getGalery(
               onSuccess200: @escaping(_ resData:GeneralResponsePhotoList)->Void,
               onDefault: @escaping(_ resData:GeneralResponsePhotoList)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        PhotoService().getGalery(onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
    }
    
    func removePhoto(photo:Int,
                     onSuccess200: @escaping  (_ resData: GeneralResponsePhotoRemove)->Void,
                     onDefault: @escaping  (_ resData: GeneralResponsePhotoRemove)->Void,
                     onError: @escaping  (_ resData: String)->Void) {
        
        PhotoService().removePhoto(photo: photo, onSuccess200: onSuccess200, onDefault: onDefault, onError: onError)
       
    }
    

}
