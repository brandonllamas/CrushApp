//
//  LoginService.swift
//  CrushApp
//
//  Created by WebAuxiliar on 14/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class LoginService : ObservableObject {
    
    
    init() {
        
    }
    
    func login(cellphone:String , indicative:String,
               onSuccess200: @escaping(_ resData:GeneralResponseUser)->Void,
               onDefault: @escaping(_ resData:GeneralResponseUser)->Void,
               onError: @escaping(_ error:String)->Void)  {
        
        self.login_request(cellphone: cellphone, indicative: indicative, onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
       
    }
    
    func saveCellphone(cellphone:String , indicative:String){
        KeyChain.saveCredentials(cellphone: cellphone, indicative: indicative)
    }
    
    
    func login_request(cellphone:String , indicative:String,
                       onSuccess200: @escaping  (_ resData: GeneralResponseUser)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseUser)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
        Alamofire.request(constans.api+"user/token",
                   method: HTTPMethod.post,
                   parameters: ["phone": cellphone,
                                "indicative" : indicative],
                   encoding: URLEncoding.default,
                   headers: [:]).responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponseUser =  try JSONDecoder().decode(GeneralResponseUser.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseUser =  try JSONDecoder().decode(GeneralResponseUser.self ,from: response.data!)
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
    
    
    
    
    
    
    func listIndicatives(
               onSuccess200: @escaping(_ resData:GeneralRespondeIndicative)->Void,
               onDefault: @escaping(_ resData:GeneralRespondeIndicative)->Void,
               onError: @escaping(_ error:String)->Void) {
        self.getIndicatives(onSuccess200: onSuccess200, onSuccessDefault: onDefault, onError: onError)
       
        }
    
    func getIndicatives(
                          onSuccess200: @escaping  (_ resData: GeneralRespondeIndicative)->Void,
                          onSuccessDefault: @escaping  (_ resData: GeneralRespondeIndicative)->Void,
                          onError: @escaping  (_ resData: String)->Void){
        
        var indicatives:[Indicative] = [];
        print(constans.api+"inicative/list")
        Alamofire.request(constans.api+"inicative/list",
                          method: .get,
                          encoding: URLEncoding.default
        ).validate()
        .responseString{response in
                            print(response)
                            switch response.result {
                            case .success(_) : do {
                                switch response.response?.statusCode {
                                case 200:
                                    do {
                                        let resData:GeneralRespondeIndicative =  try JSONDecoder().decode(GeneralRespondeIndicative.self ,from: response.data!)
                                        //indicatives = resData.data;
                                        onSuccess200(resData)
                                    } catch let error {
                                        print(error)
                                      
                                    }
                                
                                default:
                                    do {
                                        let resData:GeneralRespondeIndicative =  try JSONDecoder().decode(GeneralRespondeIndicative.self ,from: response.data!)
                                     
                                        onSuccessDefault(resData)
                                    } catch let error {
                                        print(error)
                                        
                                    }
                                    print("Ocurrio un error")
                                    print("\(response)")
                                }
                            }
                            case .failure(let error):
                                print(error)
                            }
                          }
        
    }
    
}
