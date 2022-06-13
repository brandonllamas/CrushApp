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
        //NavigationView{
        Rectangle()
            //.frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            //.foregroundColor(Color("fondoCrush"))
            .overlay(
                VStack{
                    ScrollView{
                        VStack(spacing:20){
                            if self.viewModel.vacio {
                                dialog.padding(.top, 40)
                            } else {
                                list
                            }
                        }.frame(width: .infinity, height: .infinity, alignment: .center)                    }.background(Color("BackGroundVistas"))
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
                    .background(Color("BackGroundVistas"))
            )
        //}//.background(Color("BackGroundVistas"))
        
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
    
    var dialog:some View{
        HStack{
            Spacer()
        HStack{
            HStack{
                HStack{
                    Text("Aquí podrás ver tus contactos pendientes de hacer Match. Entre más contactos selecciones,  más posibilidades tendrás de hacer Match!").foregroundColor(.white)
                        .font(.custom("", fixedSize: 15))
                        .multilineTextAlignment(.center)
                }.padding(.leading,10)
            }
            VStack{
                Text("X")
                Spacer()
            }.padding(.trailing,10)
            .padding(.top, 10)
        }
        
       
        .frame(width: 320, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color("azul"))
        .cornerRadius(16, corners: [.topLeft,.topRight, .bottomLeft, .bottomRight])
        Spacer()
        }.frame(width: .infinity, height: .infinity, alignment: .center)
            .background(Color("BackGroundVistas"))
    }
}

struct CrushView_Previews: PreviewProvider {
    static var previews: some View {
        CrushView()
    }
}
