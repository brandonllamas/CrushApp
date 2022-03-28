//
//  CameraHelper.swift
//  CrushApp
//
//  Created by WebAuxiliar on 27/03/22.
//

import Foundation
import SwiftUI
import UIKit

 



struct ImagePicker : UIViewControllerRepresentable {
 
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    var afterSelected:(UIImage)->Bool = {_ in return true}
       
       func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
           
       }
       
       func makeCoordinator() -> ImagePickerCordinator {
           return ImagePickerCordinator(isShown: $isShown, image: $image,afterSelected: afterSelected)
       }
       
       func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
           let picker = UIImagePickerController()
           picker.delegate = context.coordinator
           return picker
       }
}

struct ImagePickerCamera : UIViewControllerRepresentable {
 
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    var afterSelected:(UIImage)->Bool = {_ in return true}
       
       func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerCamera>) {
           
       }
       
       func makeCoordinator() -> ImagePickerCordinator {
           return ImagePickerCordinator(isShown: $isShown, image: $image,afterSelected: afterSelected)
       }
       
       func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerCamera>) -> UIImagePickerController {
           let picker = UIImagePickerController()
           picker.delegate = context.coordinator
            picker.sourceType = .camera
           return picker
       }
}

class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    var afterSelected:(UIImage)->Bool = {_ in return true}
   // var actual:UIImage
    
    init(isShown : Binding<Bool>, image: Binding<Image?>, afterSelected: @escaping (UIImage)->Bool) {
        _isShown = isShown
        _image   = image
   
        self.afterSelected = afterSelected
        
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        var imagetoUpload:UIImage = resizeImage(image:uiImage)
        //image = Image("logoProbi")
        isShown = false
        
        if(self.afterSelected(imagetoUpload)){
            image = Image(uiImage: imagetoUpload)
        }else{
            print("fallo")
        }
    }
    
    //Image selection got cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
    
    func resizeImage(image: UIImage) -> UIImage {
        let scale = 300 / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: 300, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: 300, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}



extension UIImage {
    func resizeWithPercent(percentage: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: size.width * percentage, height: size.height * percentage)))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    func resizeWithWidth(width: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
}

