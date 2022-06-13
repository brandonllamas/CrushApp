//
//  CurshViewModel.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class CrushViewModel:ObservableObject{
    @Published var actions:[ItemCrushMet] = []
    @Published var vacio = true
    init() {
        self.getMachList()
    }
    
    func getMachList(){
        CrushICase().getMachList(){ response in
            self.actions = response.data.data
            if(self.actions.count > 0){
                self.vacio = false} else {
                    self.vacio = true
                }
           print(response)
            
        } onDefault: { response in
           
            self.vacio = true
            print(response)
            
        } onError: { error in
     
            self.vacio = true
            print(error)
            
        }
    }

}
