//
//  UserList.swift
//  CrushApp
//
//  Created by WebAuxiliar on 18/03/22.
//

import Foundation
struct UserListRequest:Codable, Hashable {
     var data:[PhoneItemRequest];
    enum CodingKeys: String, CodingKey {
        case data
    }

}

struct PhoneItemRequest:Codable, Hashable {
     var phone,name:String;
    enum CodingKeys: String, CodingKey {
        case phone,name
    }

}


public class ToolsRequestList : ObservableObject {
    
 
    static func ConvertLisRequestToDic(phones:[PhoneItemRequest]) -> [String:Any]
    {
        var params:[String:Any] = ["data":[]]
        
        var DatosMeter:[[String:Any]] = [] ;
        phones.forEach({req in
            DatosMeter.append([
                "phone":req.phone,
                "name":req.name
            ])
        })
        params["data"] = DatosMeter;
        return params;
    }
    
}
