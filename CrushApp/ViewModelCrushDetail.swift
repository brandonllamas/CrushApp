//
//  ViewModelCrushDetail.swift
//  CrushApp
//
//  Created by WebAuxiliar on 8/03/22.
//

import Foundation
import SwiftUI

class ViewModelCrushDetail:ObservableObject{
    
    var id:Int = 0;
    @Published var images:[ImageUserListApp] = [] ;
    var AccionesCrush:[GeneralResponseActionsRes] = []
    @Published var load:Bool = false;
    @Published var arrayActionActive:[Int] = []
    @Published var rating:Int = 7;
    @Published var ratingOriginal:Int = 7;
    @Published var users:GeneralUsuario;
    @Published var name:String;
    @Published var phone:String;
    var contact:[PhoneItemRequest];
    
    init(id:Int,user:GeneralUsuario, contact:[PhoneItemRequest]) {
        self.id = id;
        self.users = user;
        if(contact.count > 0){
            self.name = contact[user.i ?? 0].name;
            self.phone = contact[user.i ?? 0].phone;
        } else {
            self.name = user.name ?? ""
            self.phone = user.phone
        }
        self.contact = contact
    }
    
    func setRating(){
        if(self.users.image != nil){
            UserCaseDetailCrush().SettRatinDetail(id_photo:self.users.image!.id,value: self.rating){response in
             print(response)
                
                self.getRating()
            } onDefault: { response in
               
                print(response)
                
            } onError: { error in
                print("Error set")
                print(error)
                
            }
        }
    }
    
    func getRating(){
        if(self.users.image != nil){
            UserCaseDetailCrush().getRatinDetail(id_photo:self.users.image!.id){response in
             print(response)
                
                self.rating = response.data;
                self.ratingOriginal = response.data;
                
            } onDefault: { response in
                print("Error get on def")
                print(response)
                
            } onError: { error in
                print("Error get")
                print(error)
                
            }
        }
     
    }
    
    func existAction(idAction:Int) -> Bool {
        var ret:Bool = false;
        self.arrayActionActive.forEach({ active in
            if(idAction == active){
                ret =  true
            }
        })
        return ret;
    }
    
    func removeItem(idaction:Int){
        var cont:Int = 0;
        self.arrayActionActive.forEach({ active in
            if(idaction == active){
                self.arrayActionActive.remove(at: cont)
            }
            cont = cont + 1;
        })
        cont = 0;
    }
    
    
    
    func detail() {
     
      print("aqui toy")
        self.load.toggle();
//        nav.advance(AnyView(CrushDetailView()), tag: .CrushDetailView)
        UserCaseDetailCrush().GetDetailUser(ids: self.id){response in
            self.images = response.data.data.gallery ?? []
            self.id = response.data.data.id;
            var arrayActionActivelocal = response.data.data.sended_match ?? []
            
            arrayActionActivelocal.forEach({response in
                self.arrayActionActive.append(response.id_action)
                
            })
            //self.arrayActionActive.append(response.data.data.sended_match)
         
            print(response)
            self.load = false;
        } onDefault: { response in
            print(response)
        } onError: { error in
            print(error)
        }
    }
    
    
    func getActions(){
        self.load.toggle();
        //self.AccionesCrush = []
  //        nav.advance(AnyView(CrushDetailView()), tag: .CrushDetailView)
          UserCaseDetailCrush().GetActionsList(){response in
            self.AccionesCrush = response.data.data
             // self.load.toggle();
              print(response)
            self.load = false;
          } onDefault: { response in
             
              print(response)
              
          } onError: { error in
       
              print(error)
              
          }
    }
    
    
    func addActionM(action:Int) {
        self.load.toggle();
        UserCaseDetailCrush().addAction(id_action: action, name:self.name, phone: self.phone){response in
            self.arrayActionActive.append(action)
            self.load = false;
            self.getActions()
            
            
          } onDefault: { response in
             
              print(response)
              
          } onError: { error in
       
              print(error)
              
          }
    }
    
    
    
    func RemoveActionM(action:Int) {
        self.load.toggle();
        UserCaseDetailCrush().removeUnmacht(id_user:self.id,id_action: action){response in
            self.removeItem(idaction: action)
           // self.arrayActionActive.remove(at: <#T##Int#>)
            //self.arrayActionActive.append(action)
            self.getActions()
            
          } onDefault: { response in
             
              print(response)
              
          } onError: { error in
       
              print(error)
              
          }
    }
    
    
    
    
}
