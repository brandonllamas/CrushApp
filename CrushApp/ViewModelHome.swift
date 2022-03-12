//
//  ViewModelHome.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelHome:ObservableObject{
    @Published var list:[UserHome];
    @Published var index = 0;
    
    init() {
        self.list = [
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 3, id: 1),
            UserHome(name: "Evaristo ", iconImagenActivate: "defaultGirl", index: 1, id: 2),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 3),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 4),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 5),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 6),
        ]
    }

}
