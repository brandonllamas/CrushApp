//
//  DetailCrushModels.swift
//  CrushApp
//
//  Created by WebAuxiliar on 22/03/22.
//

import Foundation

struct GeneralResponseActions:Codable, Hashable {
     var success:Bool;
     var data:GeneralResponseData ;
    enum CodingKeys: String, CodingKey {
        case success,data
    }
}


struct GeneralResponseActionsAsign:Codable, Hashable {
     var success:Bool;
    var message:String;
     var data:GeneralResponseDataAsign ;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
}

struct GeneralResponseDataAsign:Codable, Hashable {
     var data:GeneralResponseResAsign ;
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct GeneralResponseResAsign:Codable, Hashable {
    var id,id_user_send,id_action,id_user_recibe:Int ;
    var created_at,updated_at:String;
    enum CodingKeys: String, CodingKey {
        case id,id_user_send,id_action,id_user_recibe
        case created_at,updated_at
    }
}

struct GeneralResponseData:Codable, Hashable {
     var data:[GeneralResponseActionsRes] ;
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct GeneralResponseActionsRes:Codable, Hashable {
     var id,status,order_visible:Int;
     var name,message,message_noti,created_at,updated_at:String ;
    enum CodingKeys: String, CodingKey {
        case id,status,order_visible,updated_at,created_at,message_noti,message
        case name
    }

}


struct GeneralMachRemove:Codable, Hashable {
     var success:Bool;
     var message,data:String ;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
}


struct GeneralRating:Codable, Hashable {
     var success:Bool;
     var message:String ;
    var data:Int;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
}


struct SetGeneralRating:Codable, Hashable {
     var success:Bool;
     var message:String ;
    var data:[Int];
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }
}
