//
//  ViewModelSplash.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import SwiftUI

class ViewModelSplashScreen:ObservableObject{
    var navigation: NavigationStack?
    
    init() {
        
    }
    
    
    
    func login(nav:NavigationStack) {
        self.navigation = nav
      print("aqui toy")
        nav.advance(AnyView(TerminosView()), tag: .TerminosView)

    }
}
