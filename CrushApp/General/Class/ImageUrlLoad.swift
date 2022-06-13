//
//  ImageUrlLoad.swift
//  CrushApp
//
//  Created by WebAuxiliar on 19/03/22.
//

import Foundation
import SwiftUI
import Alamofire

struct ImageWeb: View {
    
    
    @ObservedObject var remoteImg:ImageFromUrl

    
    init(url:String) {
        self.remoteImg = ImageFromUrl(imageURL:url)
    }
    
    init(url:String, placeHolder:String) {
        self.remoteImg = ImageFromUrl(imageURL:url,placeHolder: UIImage(imageLiteralResourceName: placeHolder))
    }
    
    var body: some View {
        
        Image(uiImage: remoteImg.dataimg)
            .resizable()
        
    }
}



struct ImageWeb_Previews: PreviewProvider {
    static var previews: some View {
        ImageWeb(url: "https://diariolaeconomia.com/media/k2/items/cache/f14a896e5d42f9cdd02bc246b82ce535_XL.jpg",placeHolder:"CO")
            .scaledToFill()
            .frame(width: 100, height: 100, alignment: .center)
    }
}

import Foundation
import Combine
import AlamofireImage
import Alamofire

class ImageFromUrl: ObservableObject {
    
    var imageURL:String
    var cache:Bool = false
    
    @Published var didChange = PassthroughSubject<UIImage, Never>()
    @Published var dataimg = UIImage(){
        didSet{
            didChange.send(dataimg)
        }
    }
    
    init(){
        self.imageURL = ""
    }
    
    init(imageURL: String){
        self.imageURL = imageURL
        loadImage()
    }
    
    init(imageURL: String, placeHolder:UIImage) {
        self.imageURL = imageURL
        self.dataimg = placeHolder
        loadImage()
    }
    
    
    func loadImage() {
        
        let stringUrl = imageURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: stringUrl) else {
            print("Error with " + imageURL)
            return
            
        }
        if let imageCached = GlobalData.cacheImages[stringUrl]{
            self.dataimg = imageCached
        }
        Alamofire.request(url).responseImage { response in
                if case .success(let image) = response.result {
                    DispatchQueue.main.async {
                        self.dataimg = image
                        GlobalData.cacheImages[stringUrl] = image
                    }
                    
                }else{
                    print(self.imageURL)
                    print(response)
                }
        }
    }
    
    func cacheImage() {
        
        //        if let imgCached = DataApp.cacheImages[stringUrl] {
        //            self.dataimg = imgCached
        //        }
    }
    
    
    public func updateImg(imageURL: String){
        loadImage()
    }
    
}
