//
//  ItemPersonHomeViewModel.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import Foundation
import Foundation
import SwiftUI

class ItemPersonHomeViewModel:ObservableObject{
    
    init() {
      
    }
    
    func detail(nav:NavigationStack,user:UserHome) {
        
      print("aqui toy")
        //nav.advance(AnyView(CrushDetailView(user: user)), tag: .CrushDetailView)
    }
}
