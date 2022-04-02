//
//  ViewModelHome.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI

class ViewModelHome:ObservableObject{
    @Published var list:[UserHome];
    @Published var index = 0;
    @Published var Contactos:FetchedContacts = FetchedContacts();
    @Published var ListContactPost:[GeneralUsuario] = []
    var contactsSend:[PhoneItemRequest] = [];
    
    
    @Published var noContacts:Bool = false;
    
    init() {
        self.list = [
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 3, id: 1),
            UserHome(name: "Evaristo ", iconImagenActivate: "defaultGirl", index: 1, id: 2),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 3),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 4),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 5),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 6),
        ]
        self.getAllContactLocal()
    }
    
    func getAllContactLocal()  {
      
        DispatchQueue.main.async {
            self.Contactos.fetchContacts();
            
            print("Hola llego aca")
            print(self.Contactos.contacts);
            if(self.Contactos.contacts.isEmpty){
                self.noContacts =  true;
                return ;
            }
            self.Contactos.contacts.forEach({contact in
                let contacto:PhoneItemRequest = PhoneItemRequest(phone: DataApp.formatNumberPhone(phone: contact.phoneNumbers[0]) , name: contact.firstName);
                self.contactsSend.append(contacto);
                
                
            })
            
            
            HomeViewCase().ListApp(phones: self.contactsSend){ response in
                self.ListContactPost = response.data.data;
               print(response)
                
            } onDefault: { response in
               
                print(response)
                
            } onError: { error in
         
                print(error)
                
            }
        }
    }

}
