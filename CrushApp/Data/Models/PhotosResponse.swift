//
//  PhotosResponse.swift
//  CrushApp
//
//  Created by WebAuxiliar on 27/03/22.
//

import Foundation

struct UploadPhotoResponse:Codable, Hashable {
     var id_user,id:Int;
    var name,updated_at,created_at:String;
    enum CodingKeys: String, CodingKey {
        case id_user,id,name,updated_at,created_at
    }
}



struct GeneralResponsePhotoRemove:Codable, Hashable {
     var success:Bool;
    var message:String;
     var data:[String] ;
    enum CodingKeys: String, CodingKey {
        case success,data,message
    }

}


struct GeneralResponsePhotoList:Codable, Hashable {
     var success:Bool;
    //var message:String;
     var data:DataPhotoList ;
    enum CodingKeys: String, CodingKey {
        case success,data
        //case message
    }

}

struct DataPhotoList:Codable, Hashable {
    var data:[ItemPhotoOption] ;
    enum CodingKeys: String, CodingKey {
        case data
    }

}

struct ItemPhotoOption:Codable, Hashable {
     var id_user,id,status_profile:Int;
    var name,updated_at,created_at:String;
    var calification:String?;
    enum CodingKeys: String, CodingKey {
        case id_user,id,name,updated_at,created_at,status_profile
        case calification
    }
}
