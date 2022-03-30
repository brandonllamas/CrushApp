//
//  ListNotificationViewModel.swift
//  CrushApp
//
//  Created by WebAuxiliar on 29/03/22.
//

import Foundation
import FirebaseDatabase
import SwiftUI

class ListNotificationViewModel : ObservableObject {
    var ref: DatabaseReference!;
    
    @Published var notifications:[NotificationResponseGeneral] = [];
    @Published var notificationsCrush:[CrushesNotResponseGeneral] = [];
    
    init(){
        self.ref = Database.database().reference()
        getNotification()
        getCrushes()
    }
    
    
    
    
    func getNotification(){
        //var refe =
        self.ref.child("USERS/\(DataApp.user!.phone)/NOTIFICATIONS").observeSingleEvent(of: .value, with: { response in
            
            let noti = response.value as! NSDictionary
            
             
            print("RESPONSE NOTIFICATION")
            print(response)
    
            noti.forEach({ re2 in
                print(re2)
                let valueRe2 = re2.value as! NSDictionary;
                
                let notiData:NotificationResponse = NotificationResponse(viewed: valueRe2["viewed"] as! Bool, message: valueRe2["message"] as! String, date: valueRe2["date"] as! String)
                
                let noticonv:NotificationResponseGeneral =
                    NotificationResponseGeneral(key: re2.key as! String, value: notiData)
               
                
                self.notifications.append(noticonv)
            })
           // print(noti.allKeys)
            print(self.notifications)
            
        }){ error in
            print("Error en firebase ")
            print(error)
        }
    }
    
    
    func getCrushes(){
        //var refe =
        self.ref.child("USERS/\(DataApp.user!.phone)/CRUSHES").observeSingleEvent(of: .value, with: { response in
            
            let noti = response.value as! NSDictionary
            
             
            print("RESPONSE NOTIFICATION")
            print(response)
    
            noti.forEach({ re2 in
                print(re2)
                let valueRe2 = re2.value as! NSDictionary;
                
                
                let notiData:CrushesNotResponse = CrushesNotResponse(message: valueRe2["message"] as! String, date: valueRe2["date"] as! String)
                
                let noticonv:CrushesNotResponseGeneral =
                    CrushesNotResponseGeneral(key: re2.key as! String, value: notiData)
               
                
                self.notificationsCrush.append(noticonv)
            })
           // print(noti.allKeys)
            print(self.notifications)
            
        }){ error in
            print("Error en firebase ")
            print(error)
        }
    }
    
}
