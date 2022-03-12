//
//  FotosView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI

struct FotosView: View {
    @ObservedObject var viewModel:ViewModelFotos
        = ViewModelFotos();
    
    let columns = [
        
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
            ZStack{
                listImages
                Spacer()
                botonSubir
                 
            }
    }
    
    var listImages: some View{
        
           
        ScrollView(){
                LazyVGrid(columns: columns, spacing: 2) {
                    ForEach(self.viewModel.option, id: \.self) { photo in
                        ItemGalery(photo: photo)
                       
                        
                    }
                 }.padding(.horizontal)
        }
    }

    var botonSubir: some View{
       VStack{
        Spacer()
            Button(action: {
               print("crush")
            }, label: {
                Text("Nueva Fotos")
            })
            
            .buttonStyle(crushButtonDefault())
          
        }.padding(.vertical)
    }

}



struct FotosView_Previews: PreviewProvider {
    static var previews: some View {
        FotosView()
    }
}
