//
//  ItemViewModelNotification.swift
//  CrushApp
//
//  Created by WebAuxiliar on 2/04/22.
//
import Foundation
import FirebaseDatabase
import SwiftUI

class ItemViewModelNotification : ObservableObject {
    var refs: DatabaseReference!;
    @Published var verlo:Bool = true;
    
    init(){
        self.refs = Database.database().reference()
    }
    
    func delete(ref:String){
        //self.refs.
        print(ref)
        self.refs.child(ref).removeValue(completionBlock: {_,_ in 
            print("error")
        });
        self.verlo = false
    }

}
