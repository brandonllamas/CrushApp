//
//  NotificationResponse.swift
//  CrushApp
//
//  Created by WebAuxiliar on 30/03/22.
//

import Foundation

struct NotificationResponseGeneral:Codable, Hashable {
     var key:String;
     var value:NotificationResponse ;
    enum CodingKeys: String, CodingKey {
        case key,value
    }

}

struct NotificationResponse:Codable, Hashable {
     var viewed:Bool;
     var message,date:String ;
    enum CodingKeys: String, CodingKey {
        case message,date,viewed 
    }

}


struct CrushesNotResponseGeneral:Codable, Hashable {
     var key:String;
     var value:CrushesNotResponse ;
    enum CodingKeys: String, CodingKey {
        case key,value
    }

}

struct CrushesNotResponse:Codable, Hashable {
     //var viewed:Bool;
     var message,date:String ;
    enum CodingKeys: String, CodingKey {
        case message,date//,viewed
    }

}
