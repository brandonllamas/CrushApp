//
//  HomeViewModules.swift
//  CrushApp
//
//  Created by WebAuxiliar on 18/03/22.
//

import Foundation

struct GeneralResponseUserList:Codable, Hashable {
     var success:Bool;
    var message:String;
     var data:DataUserList ;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }

}


struct DataUserList:Codable, Hashable {
   
    var data:[GeneralUsuario] ;
    var count_phone:Int;
    enum CodingKeys: String, CodingKey {
        case data,count_phone
    }

}


struct GeneralUsuario:Codable, Hashable {
    var id,id_type_user,active,indicative,image_profile:Int;
    var name,username,password:String?;
    var email:String? ;
    var image:ImageUserListApp?;
    var gallery:[ImageUserListApp]?;
    var contact:ContactUserListApp?;
    
    var phone,created_at,updated_at,phone_completed:String ;
    enum CodingKeys: String, CodingKey {
        case name,phone,image_profile,created_at,updated_at,phone_completed
        case id,id_type_user,active,indicative,image,contact,password,gallery
    }
}


struct ImageUserListApp:Codable, Hashable {
    var id,id_user,status_profile:Int;
    var name,created_at,updated_at:String ;
       enum CodingKeys: String, CodingKey {
           case id,id_user,created_at,updated_at,name,status_profile
       }
}

struct ContactUserListApp:Codable, Hashable {
    var id,state:Int;
    var name,id_user,id_user_contact,created_at,updated_at:String ;
       enum CodingKeys: String, CodingKey {
           case id,id_user,created_at,updated_at,name,state,id_user_contact
       }
}
