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
            .customDialog(isShowing: self.$viewModel.noContacts){
                DialogNoContent.background(Color(.white))
                    .cornerRadius(30)
             }
        }
     
        
    }
    
    
    var DialogNoContent:some View{
        VStack {
            Text("Acceso contactos Denegado")
                  .padding(.bottom, 10)
             
            Divider()
            Text("Permisos de acceso a \n contactos denegados")
                .font(.system(size: 20))
              .minimumScaleFactor(0.01)
            
            Divider()
            HStack{
                
                Button(action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }) {
                  Text("Ir a ajustes")
                    .foregroundColor(Color(.blue))
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
            }
      }.padding()
    }
    
    var grid:some View{
        HStack{
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(self.viewModel.ListContactPost, id: \.self) { homePeople in
                 
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
