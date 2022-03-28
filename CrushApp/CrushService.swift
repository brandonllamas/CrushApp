//
//  CrushService.swift
//  CrushApp
//
//  Created by WebAuxiliar on 28/03/22.
//

import Foundation
import SwiftUI
import Alamofire


class CrushService : ObservableObject {
    var token:String = "";
    
    init() {
        self.token = DataApp.getToken();
    }
    
    func getMachList(
                       onSuccess200: @escaping  (_ resData: GeneralResponseMachList)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseMachList)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
   
        Alamofire.request(constans.api+"app/match/list",
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
                                    let resData:GeneralResponseMachList =  try JSONDecoder().decode(GeneralResponseMachList.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseMachList =  try JSONDecoder().decode(GeneralResponseMachList.self ,from: response.data!)
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
