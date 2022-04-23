//
//  ViewModelHome.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import Foundation
import SwiftUI
import Contacts


class ViewModelHome:ObservableObject{
    @Published var list:[UserHome];
    @Published var index = 0;
    @Published var Contactos:FetchedContacts = FetchedContacts();
    @Published var ListContactPost:[GeneralUsuario] = []
    @Published var ListContactPostZ:[SendGeneralGrud] = []
    @Published var ListContactPostZCopia:[SendGeneralGrud] = []
    @Published var ListContactPostCopia:[GeneralUsuario] = []
    @Published var contactsSend:[PhoneItemRequest] = [];
     
    
    @Published var noContacts:Bool = false;
    @Published var textFiltrer:String = "";
    
    @Published var loading:Bool = false;
    @Published var denegado = 0;
    
    @Published var contacts = [Contact]()
    
    init() {
        self.list = [
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 3, id: 1),
            UserHome(name: "Evaristo ", iconImagenActivate: "defaultGirl", index: 1, id: 2),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 3),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 4),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultGirl", index: 3, id: 5),
            UserHome(name: "Camila Gonzáles", iconImagenActivate: "defaultBoy", index: 1, id: 6),
        ]
        self.getAllContactLocalv2()
    }
    
    func filter(text:String){
        //ListContactPostZ
        self.ListContactPostZ = self.ListContactPostZCopia;
        if(text == ""){return}
       // self.contactsSend = self.ListContactPostCopia.filter {$0.name == text}
        self.ListContactPostZ = [];
        var cont = 0;
        self.ListContactPostZCopia.forEach({contact in
            var name:String =  contact.usua.contact?.name ?? "";
  
            if(  name.lowercased().range(of: text.lowercased()) != nil  ){
                var f : SendGeneralGrud = SendGeneralGrud(num: cont, usua: contact.usua)
                self.ListContactPostZ.append(f)
                cont = cont + 1;
            }
            
        })
     
        
    }
    
    
    func fetchContacts( ) {
        contacts.removeAll()
        let store = CNContactStore()
        
        
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                self.noContacts =  true;
                return
            }
            if granted {
                print("si acepto")
                self.noContacts =  false;
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in

                 //       DispatchQueue.main.async {
                            self.contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, phoneNumbers: contact.phoneNumbers.map { $0.value.stringValue }, emailAddresses: contact.emailAddresses.map { $0.value as String }
                            ))

                            self.contacts.sort(by: { $0.firstName < $1.firstName })
                       
                   //     }
                    })
                    self.getAllContactLocal();
                } catch let error {
                    print("Failed to enumerate contact", error)
                    self.noContacts =  true;
                }
                
            } else {
                print("access denied")
                self.noContacts =  true;
            }
        }
        
    }
    
    func getAllContactLocalv2() {
        DispatchQueue.main.async {
            
            self.fetchContacts()
        }
    }
    
    func formatContact(number:String) -> String{
        var num:String = number;
        //num = num.replacingCharacters(in: " ", with: "")
        if(!num.contains("+")){
            num = "+\(num)";
        }
        return num;
        
    }
    
    func getAllContactLocal()  {
        self.loading = true;
        DispatchQueue.main.async {
          
            print("Hola llego aca")
            print(self.Contactos.contacts);
            if(self.contacts.isEmpty){
                self.noContacts =  true;
                return ;
            }
            self.contacts.forEach({contact in
                //let cont = nil
                if(contact.phoneNumbers.count != 0 && !contact.firstName.isEmpty){
                    contact.phoneNumbers.forEach({con in
                        let number = self.formatContact(number:con) ;
                        let name = contact.firstName;
                        
                        
                        let contacto:PhoneItemRequest = PhoneItemRequest(phone: DataApp.formatNumberPhone(phone: number) , name: name);
                        self.contactsSend.append(contacto);
                    })
                  
                   
                }
                
                
                
            })
            print(self.contactsSend)
            
            HomeViewCase().ListApp(phones: self.contactsSend){ response in
                self.ListContactPost = response.data.data;
                self.ListContactPostCopia =  response.data.data;
                self.noContacts =  false;
                
                var count = 0;
                self.ListContactPostCopia.forEach({lits in
                    var f : SendGeneralGrud = SendGeneralGrud(num: count, usua: lits)
                    self.ListContactPostZ.append(f);
                    count = count+1;
                })
                
                
                self.ListContactPostZCopia = self.ListContactPostZ;
               print(response)
                self.loading = false;
            } onDefault: { response in
               
                print(response)
                
            } onError: { error in
         
                print(error)
                
            }
        }
    }

}
