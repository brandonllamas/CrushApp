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
        NavigationView{
        Rectangle()
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            //.foregroundColor(Color("fondoCrush"))
            .overlay(
                VStack{
                    ScrollView{
                        VStack(spacing:20){
                            list
                        }.frame(width: .infinity, height: .infinity, alignment: .center)                    }.background(Color("BackGroundVistas"))
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .background(Color("BackGroundVistas"))
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    var list: some View {
        HStack{
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.viewModel.actions, id: \.self) { homePeople in
                    NavigationLink(destination:
                                    CrushDetailView(user: homePeople.user_receive, contact: [])
                                    ){
                        ItemCrush(detail: homePeople)
                    }
                }
             }.padding(.horizontal)
            Spacer()
        }.frame(width: .infinity, height: .infinity, alignment: .center)

    }
}

struct CrushView_Previews: PreviewProvider {
    static var previews: some View {
        CrushView()
    }
}
