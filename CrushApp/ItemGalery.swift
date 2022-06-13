//
//  ItemGalery.swift
//  CrushApp
//
//  Created by WebAuxiliar on 10/03/22.
//

import SwiftUI

struct ItemGalery: View {
     //var photo:UserImage
    @ObservedObject var viewModel:ViewModelItemGalery;
    @State var eliminate:Bool = false;
    
    init(photo:ItemPhotoOption) {
         self.viewModel = ViewModelItemGalery(photo: photo)
    }
    var body: some View {
        VStack{
            if(!self.eliminate ){
                ImageWeb(url: self.viewModel.urlImage, placeHolder: "usernoimage")
                    .scaledToFit()
                    .frame(width: 160, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        ImageWeb(url: self.viewModel.urlImage, placeHolder: "usernoimage")
                            .scaledToFill()
                            .blur(radius: 5)
                            .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    .cornerRadius(10)
                    .padding(.top,8)                    
                    .overlay(
                        VStack{
                            calification
                            Spacer()
                        }
                    )
            }
            
           
          
            
        }
    }
    
    var calification:some View{
        HStack{
            Image("trash-can")
                .resizable()
                .padding(.vertical,3)
                .padding(.horizontal,9)
                .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    self.viewModel.eliminar()
                    self.eliminate.toggle();
                }
            
            Spacer()
            Rectangle()
                .overlay(
                    HStack{
                        estrellas
                    }
                )
                .cornerRadius(10, corners: [.bottomLeft,.topRight])
                .frame(width: 62, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color("Degradado")).padding(.top,4)
            
        }.padding(.vertical,3)
    }
    
    var estrellas:some View{
        HStack{
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating >= 7 ? Color.yellow : Color.gray)
                .frame(width: 13, height: 12)
               
               
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating >= 8 ? Color.yellow : Color.gray)
                .frame(width: 13, height: 12)
                
            
            Image(systemName: "star.fill").resizable()
                .foregroundColor(self.viewModel.rating == 9 ? Color.yellow : Color.gray)
                .frame(width: 13, height: 12)
            
        }.padding()
    }
}

struct ItemGalery_Previews: PreviewProvider {
 
    static var previews: some View {
        let user:ItemPhotoOption = ItemPhotoOption(id_user: 2696, id: 75, status_profile: 0, name: "1648418579.jpg", updated_at: "", created_at: "", calification: "8.00000")
        
        ItemGalery(photo: user)
    }
}
