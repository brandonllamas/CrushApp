//
//  ItemGalery.swift
//  CrushApp
//
//  Created by WebAuxiliar on 10/03/22.
//

import SwiftUI

struct ItemGalery: View {
     var photo:UserImage
    
    init(photo:UserImage) {
        self.photo = photo
    }
    var body: some View {
        VStack{
            
            Image(self.photo.imagen)
                .resizable()
                .cornerRadius(10)
                .frame(width: 160, height: CGFloat.random(in: 192...240), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.top,8)
          
            
        }
    }
}

struct ItemGalery_Previews: PreviewProvider {
 
    static var previews: some View {
        let user:UserImage = UserImage(starst: 3, imagen: "defaultGirl", index: 1, id: 1);
        
        ItemGalery(photo: user)
    }
}
