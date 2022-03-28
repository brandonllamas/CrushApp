//
//  CrushResponse.swift
//  CrushApp
//
//  Created by WebAuxiliar on 28/03/22.
//

import Foundation

struct GeneralResponseMachList:Codable, Hashable {
     var success:Bool;
    //var message:String;
     var data:DataResponseList ;
    enum CodingKeys: String, CodingKey {
        case success,data
        //case message
    }

}

struct DataResponseList:Codable, Hashable {
    var data:[ItemCrushMet] ;
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ItemCrushMet:Codable, Hashable {
    var id,id_user_send,id_user_recibe,id_action:Int;
    var created_at,updated_at:String;
    var action:GeneralResponseActionsRes;
    var user_receive:GeneralUsuario
    enum CodingKeys: String, CodingKey {
        case id,id_user_send,id_user_recibe,id_action
        case created_at,updated_at
        case action,user_receive
        
    }
}
