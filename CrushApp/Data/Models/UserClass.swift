//
//  UserClass.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import Foundation

struct GeneralResponseUser:Codable, Hashable {
     var success:Bool;
     var data:Datauser ;
    enum CodingKeys: String, CodingKey {
        case success,data
    }

}

struct Datauser:Codable, Hashable {
     var token:String;
     var user:User ;
    enum CodingKeys: String, CodingKey {
        case token,user
    }

}

struct User:Codable, Hashable {
    var id,id_type_user,active,indicative,image_profile:Int;
    var username:String?;
    var email:String? ;
     var name,phone,created_at,updated_at:String ;
    enum CodingKeys: String, CodingKey {
        case name,phone,image_profile,created_at,updated_at
        case id,id_type_user,active,indicative
      
    }
}

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
