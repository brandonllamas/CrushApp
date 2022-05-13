//
//  ItemCrush.swift
//  CrushApp
//
//  Created by WebAuxiliar on 27/03/22.
//

import SwiftUI

struct ItemCrush: View {
    
    var crushAction:ItemCrushMet;
    var urlCrush:String = "";
    
    init(detail:ItemCrushMet){
        self.crushAction = detail;
        self.urlCrush = "\( Connections.url_photo)/\(detail.user_receive.id)/\(detail.user_receive.image?.name ?? "")";
    }
    
    var body: some View {
        VStack(spacing:1){
            ImageWeb(url: self.urlCrush, placeHolder: "Vectorplaceholder")
            .scaleEffect()
            .cornerRadius(20, corners: [.topRight,.topLeft])
            //.cornerRadius(0, corners: [.bottomLeft,.bottomLeft])
            .frame(width: 158, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.top,8)
           
            HStack{
                Spacer()
                VStack{
                    Text(self.crushAction.user_receive.contact?.name ?? "No contact")
                    Text("Esperando \(self.crushAction.action.name)").font(.caption).foregroundColor(Color("SoftGradient1"))
                        .multilineTextAlignment(.center)
                        
                }
                Spacer()
            }
            .background(Color.white)
            .frame(width: 158,alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(16, corners: [.bottomLeft,.bottomRight])
        }
    }
}

 
