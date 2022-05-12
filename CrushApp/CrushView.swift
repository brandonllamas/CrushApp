//
//  CrushView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI

struct CrushView: View {
    
    @ObservedObject var viewModel:CrushViewModel
        = CrushViewModel();
    
    
    let columns = [
        
        GridItem(.flexible(),spacing: 5),
        GridItem(.flexible() ,spacing: 10),
    ]
    
    
    var body: some View {
        Rectangle()
            .background(Color("BackGroundVistas"))
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            .foregroundColor(Color("fondoCrush"))
            .overlay(
                VStack{
                    ScrollView{
                        VStack(spacing:20){
                            list
                        }
                    }.background(Color("BackGroundVistas"))
                }
            )
    }
    
    var list: some View {
        HStack{
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.viewModel.actions, id: \.self) { homePeople in 
                    ItemCrush(detail: homePeople)
                }
             }.padding(.horizontal)
            Spacer()
        }
    }
}

struct CrushView_Previews: PreviewProvider {
    static var previews: some View {
        CrushView()
    }
}
