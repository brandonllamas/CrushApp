//
//   ViewModelMainNavigation.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelNavigation:ObservableObject{
    @Published var indexSel = 0;
    @Published var option:[OptionItem] ;
    
    init() {
        self.option = [
            OptionItem(name: "Inicio", iconImagen: "VectorHomeNormal", iconImagenActivate: "VectorHomeActive", index: 0),
            OptionItem(name: "Fotos", iconImagen: "VectorFotosNormal", iconImagenActivate: "VectorFotosActve", index: 1),
            OptionItem(name: "Crush", iconImagen: "curshIconMenu", iconImagenActivate: "curshIconMenuActive", index: 2),
            OptionItem(name: "Configuracion", iconImagen: "ConfigurationInactive", iconImagenActivate: "ConfigurationActive", index: 3),
        ];
    }

}

struct OptionItem:Identifiable{
    var id = UUID();
     var name:String = "";
     var iconImagen:String = "";
     var iconImagenActivate:String = "";
     var index = 0;

}
