//
//  ButtonStyles.swift
//  CrushApp
//
//  Created by WebAuxiliar on 6/03/22.
//

import Foundation
import SwiftUI

struct redRoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 80, height: 0)
            .foregroundColor(.white)
            .font(.custom("josefinsans", size: 16))
            .padding()
            .background(Color("ColorPrimary"))
            .cornerRadius(30)
    }
}


struct greenButtonDefault: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 300, height: 0)
            .foregroundColor(.black)
            .padding()
            .background(Color("Cian"))
            .cornerRadius(30)
    }
}


struct crushButtonDefault: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 25)
            .foregroundColor(.black)
            .padding()
            .background(Color("azul"))
            .cornerRadius(30)
    }
}


struct crushButtonImagenAcept: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 130, height: 25)
           // .foregroundColor(.black)
            .padding()
            .background(Color.white)
            .cornerRadius(30)
    }
}


struct crushButtonDefaultDetail: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 25)
            .foregroundColor(.black)
            .padding()
            .background(Color("Cian"))
            .cornerRadius(30)
    }
}

struct btnDialogDetail: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 20)
            .foregroundColor(Color("textoNormal"))
            .padding()
            .background(Color(.white))
            .cornerRadius(30)
    }
}
struct btnDialogDetailAcept: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 20)
            .foregroundColor(Color(.black))
            .padding()
            .background(Color("AzulDegradado"))
            .cornerRadius(30)
    }
}


struct crushButtonPhoto: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 25)
            .foregroundColor(.black)
            .padding()
            .background(Color("azul"))
            .cornerRadius(30)
    }
}
