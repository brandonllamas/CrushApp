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
    
    init() {
        self.getMachList()
    }
    
    func getMachList(){
        CrushICase().getMachList(){ response in
            self.actions = response.data.data
           print(response)
            
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }

}
