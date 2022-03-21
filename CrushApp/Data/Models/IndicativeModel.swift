//
//  IndicativeModel.swift
//  CrushApp
//
//  Created by WebAuxiliar on 14/03/22.
//

import Foundation


struct GeneralRespondeIndicative:Codable, Hashable {
     var success:Bool;
     var data:DataIndicative ;
    enum CodingKeys: String, CodingKey {
        case success,data
    }

}

struct DataIndicative:Codable, Hashable {
   
    var data:[Indicative] ;
    enum CodingKeys: String, CodingKey {
        case data
    }

}


struct Indicative:Codable, Hashable {
     var id:Int;
     var name,value:String ;
    enum CodingKeys: String, CodingKey {
        case id,name,value
    }

}
