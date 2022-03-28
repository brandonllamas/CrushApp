//
//  ViewModelItemGalery.swift
//  CrushApp
//
//  Created by WebAuxiliar on 10/03/22.
//

import Foundation
import SwiftUI

class ViewModelItemGalery:ObservableObject{
    @Published var rating:Int = 7
    @Published var urlImage:String = "";
    @Published var photo:ItemPhotoOption ;
    
    init(photo:ItemPhotoOption) {
        
        self.urlImage = "\( Connections.url_photo)/\(photo.id_user)/\(photo.name)";
        
        if(photo.calification != nil){
            let sepr = photo.calification!.components(separatedBy: ".");
            self.rating = Int(sepr[0]) ?? 7;
        }
        self.photo = photo;
    }
    
    func eliminar()  {
        PhotoCase().removePhoto(photo:self.photo.id){ response in
            //self.option = response.data.data
            print("response correct")
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }

}
