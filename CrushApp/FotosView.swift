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
                if(self.viewModel.showCaptureImage){
              
                    ImagePickerCamera(isShown: self.$viewModel.showCaptureImage, image: self.$viewModel.image, afterSelected: {photo in
                        let compressed:UIImage = photo.resizeWithWidth(width: 350)!
                        let data: Data? = compressed.pngData()
                        let dataString:String? = data?.base64EncodedString(options: .endLineWithLineFeed)
                        
                        if dataString != nil{
                            self.viewModel.stringImageTosend = dataString!
                        }
                        self.viewModel.showCaptureImage = false;
                        
                        return true;
                    })
                }
                
                //galeria
                if(self.viewModel.showCaptureImageGalery){
                    ImagePicker(isShown: self.$viewModel.showCaptureImage, image: self.$viewModel.image, afterSelected: {photo in
                        let compressed:UIImage = photo.resizeWithWidth(width: 350)!
                        let data: Data? = compressed.pngData()
                        let dataString:String? = data?.base64EncodedString(options: .endLineWithLineFeed)
                        
                        if dataString != nil{
                            self.viewModel.stringImageTosend = dataString!
                        }
                        
                        self.viewModel.showCaptureImageGalery = false;
                        
                        return true;
                    })
                }
      
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
                self.viewModel.dialogAction.toggle()
            }, label: {
                Text("Nueva Fotos")
            })
            
            .buttonStyle(crushButtonDefault())
          
        }.padding(.vertical)
       .customDialog(isShowing: self.$viewModel.dialogAction){
        dialogBotonAction
       }
       .customDialog(isShowing: self.$viewModel.dialogAceptCamera){
        DialogAceptCamera
       }
    }
    
    var DialogAceptCamera:some View{
        VStack{
            Spacer()
            if(self.viewModel.image != nil){
                self.viewModel.image?
                    .resizable()
                    .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(16)
            }else{
                Image("defaultGirl")
                    .resizable()
                    .frame(width: 326, height: 495, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(16)
            }
           
            HStack{
                Spacer()
                if(self.viewModel.LoadSubirImage){
                   
                        DotView() // 1.
                                   DotView(delay: 0.2) // 2.
                                   DotView(delay: 0.4) // 3.
     
                }else{
                    Button(action: {
                        self.viewModel.dialogAceptCamera = false
                    }, label: {
                        Text("Cancelar").foregroundColor(Color.black)
                    })
                    .buttonStyle(crushButtonImagenAcept())
                    
                    
                    Button(action: {
                        self.viewModel.uploadPhoto()
                    }, label: {
                        Text("Aceptar").foregroundColor(Color.black)
                    })
                    .buttonStyle(crushButtonImagenAcept())
                    
                }
             
               
                Spacer()
            }
            Spacer()
        }
    }
    
    var dialogBotonAction:some View{
        VStack{
         Spacer()
            HStack{
                VStack{
                    Button(action: {
                        self.viewModel.openPhoto()
                    }, label: {
                        Text("Tomar foto").foregroundColor(Color.black)
                    })
                    Divider().padding(.horizontal,10)
                    
                    Button(action: {
                        self.viewModel.openPhotoGalery()
                    }, label: {
                        Text("Subir desde Galeria").foregroundColor(Color.black)
                    })
                }.padding()
            }.background(Color.white)
            .cornerRadius(16)
            
            HStack{
                Spacer()
                Button(action: {
                    self.viewModel.dialogAction = false;
                }, label: {
                    Text("Cancelar").foregroundColor(Color.red)
                }).padding()
                Spacer()
            }.background(Color.white)
            .cornerRadius(16)
            .onTapGesture {
                self.viewModel.dialogAction = false;
            }
        }
    }

}



struct FotosView_Previews: PreviewProvider {
    static var previews: some View {
        FotosView()
    }
}
