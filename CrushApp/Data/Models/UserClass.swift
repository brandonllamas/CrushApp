//
//  UserClass.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import Foundation


struct UserHome:Codable, Hashable {
     var name:String;
     var iconImagenActivate:String ;
    var index,id:Int;
    var cpl:Int?;
    
    enum CodingKeys: String, CodingKey {
        case id,iconImagenActivate,index,name,cpl
    }

}


struct UserImage:Codable, Hashable {
     var starst:Int;
     var imagen:String ;
    var index,id:Int;
 
    enum CodingKeys: String, CodingKey {
        case starst,imagen,index,id
    }

}
