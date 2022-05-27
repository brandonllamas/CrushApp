//
//  CrushDetailService.swift
//  CrushApp
//
//  Created by WebAuxiliar on 21/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class CrushDetailService : ObservableObject {
    var token:String = "";
    
    init() {
        self.token = DataApp.getToken();
    }
    
    
    func RemoveAction(id_user:Int ,id_action:Int,
                       onSuccess200: @escaping  (_ resData: GeneralMachRemove)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralMachRemove)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
         
        Alamofire.request(constans.api+"app/match/remove",
                   method: HTTPMethod.post,
                   parameters:["id_user_recibe":id_user,"id_action":id_action],
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralMachRemove =  try JSONDecoder().decode(GeneralMachRemove.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralMachRemove =  try JSONDecoder().decode(GeneralMachRemove.self ,from: response.data!)
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
    
    func AsignAction(id_action:Int,name:String,phone:String,
                       onSuccess200: @escaping  (_ resData: GeneralResponseActionsAsign)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseActionsAsign)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
         
        Alamofire.request(constans.api+"app/match/create/ios",
                   method: HTTPMethod.post,
                          parameters:["phone":phone,"id_action":id_action, "name":name],
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponseActionsAsign =  try JSONDecoder().decode(GeneralResponseActionsAsign.self ,from: response.data!)
                                    onSuccess200(resData)
                                    print("SII SE HIZO EL MATCH CONGRATULATIONS")
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseActionsAsign =  try JSONDecoder().decode(GeneralResponseActionsAsign.self ,from: response.data!)
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
    
    
    
    func getDetailCrush(id:Int,
                       onSuccess200: @escaping  (_ resData: GeneralDetailCrushResponse)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralDetailCrushResponse)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        
        Alamofire.request(constans.api+"app/user/detail?id=\(id)",
                          encoding: URLEncoding.default,
                          headers: ["Authorization": self.token]
        ).validate()
        .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralDetailCrushResponse =  try JSONDecoder().decode(GeneralDetailCrushResponse.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralDetailCrushResponse =  try JSONDecoder().decode(GeneralDetailCrushResponse.self ,from: response.data!)
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
    
    
    
    func SettRatingBar(id:Int,Value:Int,
                       onSuccess200: @escaping  (_ resData: SetGeneralRating)->Void,
                       onSuccessDefault: @escaping  (_ resData: SetGeneralRating)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        
        Alamofire.request(constans.api+"app/rating/set?id_galery=\(id)&value=\(Value)",
                          encoding: URLEncoding.default,
                          headers: ["Authorization": self.token]
        ).validate()
        .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:SetGeneralRating =  try JSONDecoder().decode(SetGeneralRating.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:SetGeneralRating =  try JSONDecoder().decode(SetGeneralRating.self ,from: response.data!)
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
    
    func getRatingBar(id:Int,
                       onSuccess200: @escaping  (_ resData: GeneralRating)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralRating)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        
        Alamofire.request(constans.api+"app/rating?id_galery=\(id)",
                          encoding: URLEncoding.default,
                          headers: ["Authorization": self.token]
        ).validate()
        .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralRating =  try JSONDecoder().decode(GeneralRating.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralRating =  try JSONDecoder().decode(GeneralRating.self ,from: response.data!)
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
    
    
    func getListAction(
                       onSuccess200: @escaping  (_ resData: GeneralResponseActions)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseActions)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
       
        
        Alamofire.request(constans.api+"app/acction/list",
                          encoding: URLEncoding.default,
                          headers: ["Authorization": self.token]
        ).validate()
        .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponseActions =  try JSONDecoder().decode(GeneralResponseActions.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseActions =  try JSONDecoder().decode(GeneralResponseActions.self ,from: response.data!)
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
