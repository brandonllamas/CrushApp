//
//  KeynsChains.swift
//  CrushApp
//
//  Created by WebAuxiliar on 16/03/22.
//

import Foundation

class KeyChain {

    class func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }
    
    class func save(key: String, data: String) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func load(key: String) -> String? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! String?
        } else {
            return nil
        }
    }

    static func saveCredentials(cellphone:String, indicative:String){
        let userData = cellphone
        let statusUser = self.save(key: "cellphone", data: userData)
        
        let pswData = indicative
        let statusPsw = self.save(key: "indicative", data: pswData)
        
        print("status: ", statusUser)
        print("status: ", statusPsw)
    }

    
    static func saveKeyPos(key:String ){
        let keyPos = key
        let statusKeyPos = self.save(key: "keyPos", data: keyPos)
    }
    
    static func saveKeyUser(key:String ){
        let keyPos =  key
        let statusKeyUser = self.save(key: "keyUser", data: keyPos)
    }
    
    class func createUniqueID() -> String {
        let uuid: CFUUID = CFUUIDCreate(nil)
        let cfStr: CFString = CFUUIDCreateString(nil, uuid)

        let swiftString: String = cfStr as String
        return swiftString
    }
    
    
}

 

 
