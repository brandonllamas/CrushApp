//
//  ViewModelFotos.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelFotos:ObservableObject{
    @Published var option:[UserImage] ;
    
    init() {
        self.option = [
            UserImage(starst: 3, imagen: "defaultGirl", index: 1, id: 1),
            UserImage(starst: 2, imagen: "defaultBoy", index: 2, id: 2),
            UserImage(starst: 1, imagen: "defaultGirl", index: 3, id: 3),
            UserImage(starst: 3, imagen: "defaultGirl", index: 4, id: 4),
            UserImage(starst: 3, imagen: "defaultGirl", index: 5, id: 5),
            UserImage(starst: 1, imagen: "defaultBoy", index: 6, id: 6),
            UserImage(starst: 2, imagen: "defaultBoy", index: 7, id: 7),
            UserImage(starst: 3, imagen: "defaultGirl", index: 8, id: 8),
            UserImage(starst: 2, imagen: "defaultBoy", index: 9, id: 9),
            UserImage(starst: 3, imagen: "defaultGirl", index: 10, id: 10),
        ];
    }

}
