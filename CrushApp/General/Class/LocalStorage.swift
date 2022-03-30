//
//  LocalStorage.swift
//  CrushApp
//
//  Created by WebAuxiliar on 29/03/22.
//

import Foundation

class LocalStorage{
    
    class func save(value:String, key:String){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    class func load(key:String) -> String{
        let defaults = UserDefaults.standard
        if let value = defaults.string(forKey: key) {
            //print(stringOne) // Some String Value
            return value;
        }
        return "";
    }
    
}
