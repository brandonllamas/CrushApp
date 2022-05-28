//
//   ViewModelMainNavigation.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import FirebaseDatabase
import SwiftUI

class ViewModelNavigation:ObservableObject{
    @Published var indexSel = 0 {
        didSet{
            getNotification()
               //Write code, function do what ever you want todo
           }
    };
    @Published var option:[OptionItem] ;
    @Published var viewNotification:Bool = false;
    
    var ref: DatabaseReference!;
    
    @Published var notifications:[NotificationResponseGeneral] = [];
    @Published var notificationsCrush:[CrushesNotResponseGeneral] = [];
    
    @Published var loading:Bool = false;
    
    
    init() {
        self.option = [
            OptionItem(name: "Inicio", iconImagen: "VectorHomeNormal", iconImagenActivate: "VectorHomeActive", index: 0),
            OptionItem(name: "Fotos", iconImagen: "VectorFotosNormal", iconImagenActivate: "VectorFotosActve", index: 1),
            OptionItem(name: "Crush", iconImagen: "curshIconMenu", iconImagenActivate: "curshIconMenuActive", index: 2),
            OptionItem(name: "Ajustes", iconImagen: "ConfigurationInactive", iconImagenActivate: "ConfigurationActive", index: 3),
        ];
        self.ref = Database.database().reference()
        getNotification()
    }
    
    func setNotification(){
       // self.getNotification()
        self.ref.child("USERS/\(DataApp.user!.phone)/NOTIFICATIONS").observeSingleEvent(of: .value, with: { response in
            print(response)
            if(response.exists()){
                let noti = response.value as! NSDictionary
                
                 
                print("RESPONSE NOTIFICATION")
               
                var  noLeidas:Int = 0;
                //self.notifications = [];
                noti.forEach({ re2 in
                    print(re2)
                    let valueRe2 = re2.value as! NSDictionary;
                    
                    let ref:String = "USERS/\(DataApp.user!.phone)/NOTIFICATIONS/\(re2.key)";
                    
                    let notiData:NotificationResponse = NotificationResponse(viewed: valueRe2["viewed"] as! Bool, message: valueRe2["message"] as! String, date: valueRe2["date"] as! String,ref:ref)
                    
                    let noticonv:NotificationResponseGeneral =
                        NotificationResponseGeneral(key: re2.key as! String, value: notiData)
                   
                    if(noticonv.value.viewed == false){
                        noLeidas = noLeidas + 1;
                        self.notifications.append(noticonv)
                    }
                   
                })
                
                if(noLeidas != 0){
                    self.notifications.forEach({element in
                        print(element)
                        self.ref.child("USERS/\(DataApp.user!.phone)/NOTIFICATIONS")
                            .child(element.key)
                            .updateChildValues([
                        "viewed": true,
                        "message": element.value.message,
                        "date":element.value.date,
                        "ref":element.value.ref ])
                    })
                    self.viewNotification = false;
                }else{
                    self.viewNotification = false;
                }
            }
            
           
            
        }){ error in
            print("Error en firebase ")
            print(error)
            self.loading = false;
        }
     
    }
    
    func getNotification(){
        //var refe =
        //self.ref.child("USERS/\(DataApp.user!.phone)/NOTIFICATIONS").removeValue();
        self.loading = true;
        self.notifications = []
        self.ref.child("USERS/\(DataApp.user!.phone)/NOTIFICATIONS").observeSingleEvent(of: .value, with: { response in
            print(response)
            if(response.exists()){
                let noti = response.value as! NSDictionary
                
                 
                print("RESPONSE NOTIFICATION")
               
                var  noLeidas:Int = 0;
                //self.notifications = [];
                noti.forEach({ re2 in
                    print(re2)
                    let valueRe2 = re2.value as! NSDictionary;
                    
                    let ref:String = "USERS/\(DataApp.user!.phone)/NOTIFICATIONS/\(re2.key)";
                    
                    let notiData:NotificationResponse = NotificationResponse(viewed: valueRe2["viewed"] as! Bool, message: valueRe2["message"] as! String, date: valueRe2["date"] as! String,ref:ref)
                    
                    let noticonv:NotificationResponseGeneral =
                        NotificationResponseGeneral(key: re2.key as! String, value: notiData)
                   
                    if(noticonv.value.viewed == false){
                        noLeidas = noLeidas + 1;
                        self.notifications.append(noticonv)
                    }
                   
                })
                
                if(noLeidas != 0){
                    self.viewNotification = true;
                }else{
                    self.viewNotification = false;
                }
            }
            
           
            
        }){ error in
            print("Error en firebase ")
            print(error)
            self.loading = false;
        }
    }

}




struct OptionItem:Identifiable{
    var id = UUID();
     var name:String = "";
     var iconImagen:String = "";
     var iconImagenActivate:String = "";
     var index = 0;

}
