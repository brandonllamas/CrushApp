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

struct DataClass: Codable {
    let data:[GeneralUsuario]
}
struct GeneralResponseBlock:Codable, Hashable {
    var success:Bool;
    var message:String;
    var data:[String] ;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
    
}

struct GeneralDetailCrushResponse:Codable, Hashable {
    var success:Bool;
    //var message:String;
    var data:DataDetailCrushResponse ;
    enum CodingKeys: String, CodingKey {
        case success,data
    }
    
}

struct DataDetailCrushResponse:Codable, Hashable {
    var data:GeneralUsuario ;
    enum CodingKeys: String, CodingKey {
        case data
    }
    
}


struct GeneralUsuarioDetai:Codable, Hashable {
    var id,id_type_user,active,indicative,image_profile:Int;
    var name,username,password:String?;
    var email,phone_completed:String? ;
    var image:ImageUserListApp?;
    var gallery:[ImageUserListApp]?;
    var contact:ContactUserListApp?;
    
    var phone,created_at,updated_at:String ;
    enum CodingKeys: String, CodingKey {
        case name,phone,image_profile,created_at,updated_at,phone_completed
        case id,id_type_user,active,indicative,image,contact,password,gallery
    }
}

struct DataUserList:Codable, Hashable {
    
    var data:[GeneralUsuario] ;
    var count_phone:Int?;
    enum CodingKeys: String, CodingKey {
        case data,count_phone
    }
    
}


struct DataUserListBlock:Codable, Hashable {
    var data:[DataUsertBlock] ;
    var success:Bool;
    var message:String;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
    
}


struct DataUsertBlock:Codable, Hashable {
    var id,state:Int;
    var id_user,id_user_blocked,created_at,updated_at:String;
    var user_blocked:GeneralUsuario;
    enum CodingKeys: String, CodingKey {
        case id_user,id_user_blocked,created_at,updated_at
        case id,state
        case user_blocked
    }
}

struct GeneralUsuario:Codable, Hashable {
    var id,id_type_user,active,indicative,image_profile:Int;
    var name,username,password:String?;
    var email,phone_completed:String? ;
    var image:ImageUserListApp?;
    var gallery:[ImageUserListApp]?;
    var contact:ContactUserListApp?;
    var sended_match:[MachSended]?;
    
    var phone,created_at,updated_at:String ;
    enum CodingKeys: String, CodingKey {
        case name,phone,image_profile,created_at,updated_at,phone_completed
        case id,id_type_user,active,indicative,image,contact,password,gallery
        case sended_match
    }
}

struct SendGeneralGrud:Codable, Hashable {
    var num:Int;
    var usua:GeneralUsuario
    enum CodingKeys: String, CodingKey {
        case num
        case usua
    }
}


struct MachSended:Codable, Hashable {
    var id,id_user_send,id_user_recibe,id_action:Int;
    var created_at,updated_at:String ;
    var action:GeneralResponseActionsRes;
    enum CodingKeys: String, CodingKey {
        case id,id_user_send,id_user_recibe,id_action
        case created_at,updated_at
        case action
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
