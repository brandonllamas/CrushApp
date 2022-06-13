//
//  ViewModelFotos.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelFotos:ObservableObject{
    @Published var option:[ItemPhotoOption] = [] ;
    @Published var dialogAction:Bool = false;
    @Published var dialogAceptCamera:Bool = false;
    
    //para tomar foto
    @Published var showCaptureImage:Bool = false;
    @Published var showCaptureImageGalery:Bool = false;
    @Published var image: Image? =   Image("usernoimage");
    
    //Loadings
    @Published var LoadSubirImage:Bool = false;
    
    
    
    
    //TO send
    @Published var stringImageTosend:String = ""

    
    init() {
        self.getGalery()
    }
    
    func closeDialog(){
        self.dialogAceptCamera = false
    }
    
    func getGalery(){
        PhotoCase().getGalery(){ response in
            self.option = response.data.data
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }
    
    func openPhoto(){
        self.dialogAction = false;
        self.showCaptureImage.toggle()
        self.dialogAceptCamera.toggle()
    }
    
    func openPhotoGalery(){
        self.dialogAction = false;
        self.showCaptureImageGalery.toggle()
        self.dialogAceptCamera.toggle()
    }
    
    
    func uploadPhoto(){
        self.LoadSubirImage = true;
        PhotoCase().UploadPhoto(image: self.stringImageTosend){ response in
            print("res normi")
           print(response)
            self.dialogAceptCamera = false
            self.LoadSubirImage = false;
            self.getGalery();
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }

}
