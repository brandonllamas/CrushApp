//
//  SettingsServices.swift
//  CrushApp
//
//  Created by WebAuxiliar on 30/03/22.
//

 

import Foundation
import SwiftUI
import Alamofire


class SettingsServices : ObservableObject {
    var token:String = "";
    
    init() {
        self.token = DataApp.getToken();
    }
    
    func getUserListApp(
                       onSuccess200: @escaping  (_ resData: DataUserListBlock)->Void,
                        onDefault: @escaping  (_ resData: DataUserListBlock)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
      
        Alamofire.request(constans.api+"app/user/blocked",
                   method: HTTPMethod.get,
                   //parameters:params,
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:DataUserListBlock =  try JSONDecoder().decode(DataUserListBlock.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:DataUserListBlock =  try JSONDecoder().decode(DataUserListBlock.self ,from: response.data!)
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
    
    
    
    func blockUser(id_user:Int,
                       onSuccess200: @escaping  (_ resData: GeneralResponseBlock)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseBlock)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
         
        Alamofire.request(constans.api+"app/user/blocked",
                   method: HTTPMethod.post,
                   parameters:["id_block":id_user],
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponseBlock =  try JSONDecoder().decode(GeneralResponseBlock.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseBlock =  try JSONDecoder().decode(GeneralResponseBlock.self ,from: response.data!)
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
