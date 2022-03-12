//
//  HomeView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel:ViewModelHome
        = ViewModelHome();
    
    let columns = [
        
        GridItem(.flexible(),spacing: 5),
        GridItem(.flexible() ,spacing: 10),
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                textBuscar
                ScrollView {
                    VStack(spacing: 20) {
                        grid
                    }
                }
                Spacer()
            }.navigationBarTitle("")
                .navigationBarHidden(true)
            .background(Color(.white))
        }
     
        
    }
    
    var grid:some View{
        HStack{
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.viewModel.list, id: \.self) { homePeople in
                 
                    NavigationLink(destination:
                    CrushDetailView(user: homePeople)
                                    ){
                        ItemPersonaHome(user: homePeople)
                            .background(Color.white)
                    } .background(Color.white)
                    
                    
                }
             }.padding(.horizontal)
            Spacer()
        }
     
        
    }
    
    var textBuscar:some View{
        HStack{
            Spacer()
            HStack {
                Image( "search")
                TextField("Buscar por nombre", text: .constant("")).foregroundColor(Color.gray).font(Font.custom("", size: 16))
            }
            
            .padding()
            .background(Color(.white))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2).foregroundColor(Color("SoftGradient1")))
            
            
            .padding(.horizontal,50)
            .padding(.bottom,2)
            .padding(.top,15)
            Spacer()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
