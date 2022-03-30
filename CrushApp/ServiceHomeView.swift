//
//  ServiceHomeView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 18/03/22.
//
import Foundation
import SwiftUI
import Alamofire


class ServiceHomeView : ObservableObject {
    var token:String = "";
    
    init() {
        self.token = DataApp.getToken();
    }
    
    func getUserListApp(phones:[PhoneItemRequest],
                       onSuccess200: @escaping  (_ resData: GeneralResponseUserList)->Void,
                       onSuccessDefault: @escaping  (_ resData: GeneralResponseUserList)->Void,
                       onError: @escaping  (_ resData: String)->Void)
                       {
        let data:UserListRequest = UserListRequest(data: phones);
        let json:Any?;
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(phones)
            json = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
           
        } catch let error {
            print("Error : \(error.localizedDescription)")
            json  = phones
        }
        print("CELLPHONE SEND")
        
        var params:[String:Any] = ToolsRequestList.ConvertLisRequestToDic(phones: phones)
   
        print(params.debugDescription)
        Alamofire.request(constans.api+"app/user/list",
                   method: HTTPMethod.post,
                   parameters:params,
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": self.token])
                .responseString { response in
                    print(response)
                    switch response.result {
                        case .success:
                            switch response.response?.statusCode {
                            case 200:
                                do {
                                    let resData:GeneralResponseUserList =  try JSONDecoder().decode(GeneralResponseUserList.self ,from: response.data!)
                                    onSuccess200(resData)
                                } catch let error {
                                    print(error)
                                }
                         
                            default:
                                do {
                                    let resData:GeneralResponseUserList =  try JSONDecoder().decode(GeneralResponseUserList.self ,from: response.data!)
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
