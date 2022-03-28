//
//  ListNotificationView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 28/03/22.
//

import SwiftUI

struct ListNotificationView: View {
    var tabActive:Int = 0
    
    var body: some View {
        ZStack{
            degradado
            vista
           
        }.onAppear(){
           
        }
    }
    
    var vista:some View{
        VStack{
            
        }
    }
    
    
    var degradado: some View{
        LinearGradient(gradient: Gradient(colors: [
            Color("Cian"),
            Color("AzulDegradado"),
            Color("Magneta")
           
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct ListNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ListNotificationView()
    }
}
