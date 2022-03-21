//
//  DataApp.swift
//  CrushApp
//
//  Created by WebAuxiliar on 16/03/22.
//

import Foundation
public class DataApp : ObservableObject {
    
    static var authUser:Datauser?
    static var user: User?
    
    static func getToken() -> String
    {
        let token:String = "Bearer " + (DataApp.authUser?.token ?? "")
        return token;
    }
    
    static func formatNumberPhone(phone:String) -> String
    {
        var final:String = phone.replacingOccurrences(of: "(", with: "");
        final = final.replacingOccurrences(of: ")", with: "")
        final = final.replacingOccurrences(of: "-", with: "")
        final = final.replacingOccurrences(of: " ", with: "")
        
        return final;
    }
    
}
