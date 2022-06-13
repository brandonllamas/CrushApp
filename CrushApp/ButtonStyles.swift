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
            .frame(width: 300, height: 15)
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

struct btnSmsConf: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 311, height: 30)
            .foregroundColor(.black)
            .padding()
            .background(Color("ColorConfAzul"))
            .cornerRadius(16)
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
            .foregroundColor(Color(.black))
            .padding()
            .background(Color("SoftBlue"))
            .cornerRadius(30)
    }
}

struct btnDialogDetailGradient: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 20)
            .foregroundColor(Color(.white))
            .padding()
            .background(degradado)
            .cornerRadius(30)
    }
    var degradado:some View{
        LinearGradient(gradient: Gradient(colors: [
            Color("SoftGradient1"),
            Color("SoftGradient2"),
            Color("SoftGradient3"),
            Color("SoftGradient4")
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }}

struct btnDialogDetailClose: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .frame(width: 330, height: 20)
            .foregroundColor(Color(.white))
            .padding()
            .background(Color("CloseRed"))
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
