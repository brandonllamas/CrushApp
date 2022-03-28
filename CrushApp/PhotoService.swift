//
//  PhotoService.swift
//  CrushApp
//
//  Created by WebAuxiliar on 27/03/22.
//
 
import Foundation
import SwiftUI
import Alamofire
import UIKit


class PhotoService : ObservableObject {
    var token:String = "";
    
    init() {
        self.token = DataApp.getToken();
    }
    
    func UploadPhoto(image:String,
                       onSuccess200: @escaping  (_ resData: UploadPhotoResponse)->Void,
                       onSuccessDefault: @escaping  (_ resData: UploadPhotoResponse)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
        let parameters = ["f":""] //Optional for extra parameter
        let headers = ["Authorization":self.token]
            Alamofire.upload(multipartFormData: { multipartFormData in
                
                    multipartFormData.append((Data(base64Encoded: image) ?? Data()), withName: "file",fileName: "file.jpg", mimeType: "image/jpg")
                    for (key, value) in parameters {
                            multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                        } //Optional for extra parameters
                },
            to: constans.api + "app/galery/upload",
            method: .post ,
            headers: headers
            ){(result) in
            switch result {
            case .success(let upload, _, _):

                //mientras lo envia
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })

                upload.responseJSON { response in
                    do {
                        let resData:UploadPhotoResponse =  try JSONDecoder().decode(UploadPhotoResponse.self ,from: response.data!)
                        onSuccess200(resData)
                    } catch let error {
                        print(error)
                    }
                }

            default:
                print("error")
            }
        }
             
      }
  
    
    func removePhoto(photo:Int,
                       onSuccess200: @escaping  (_ resData: GeneralResponsePhotoRemove)->Void,
                       onDefault: @escaping  (_ resData: GeneralResponsePhotoRemove)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        Alamofire.request(constans.api+"app/galery/delete",
                   method: HTTPMethod.post,
                   parameters: ["id_galery":photo],
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponsePhotoRemove =  try JSONDecoder().decode(GeneralResponsePhotoRemove.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponsePhotoRemove =  try JSONDecoder().decode(GeneralResponsePhotoRemove.self ,from: response.data!)
                                    onDefault(resData)
                                } catch let error {
                                    print(error)
                                }
                                print("Ocurrio un error")
                                print("\(response)")
                            }

                        case .failure(let error):
                            print (error)
                        }
                   }
            }
    
    func getGalery(
                       onSuccess200: @escaping  (_ resData: GeneralResponsePhotoList)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponsePhotoList)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        Alamofire.request(constans.api+"app/galery/list",
                   method: HTTPMethod.get,
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponsePhotoList =  try JSONDecoder().decode(GeneralResponsePhotoList.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponsePhotoList =  try JSONDecoder().decode(GeneralResponsePhotoList.self ,from: response.data!)
                                    onSuccessDefault(resData)
                                } catch let error {
                                    print(error)
                                }
                                print("Ocurrio un error")
                                print("\(response)")
                            }

                        case .failure(let error):
                            print (error)
                        }
                   }
            }
    
}
