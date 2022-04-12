//
//  TerminosViewModel.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import SwiftUI

class ViewModelTerminos:ObservableObject{
    @Published var acept:Bool = false;
    var navigation: NavigationStack?
    @Published var aceptado:Bool = false;
    
    init() {
        
    }
    
    func aceptarTerminos(nav:NavigationStack) {
       
        self.navigation = nav
      print("aqui toy")
        nav.advance(AnyView(PresentationView()), tag: .PortadaView)

    }
}
