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
   // @Published var list:[UserHome];
    @Published var index = 0;
    @Published var Contactos:FetchedContacts = FetchedContacts();
    var ListContactPost:[GeneralUsuario] = []
    @Published var ListContactPostZ:[SendGeneralGrud] = []
    var ListContactPostZCopia:[SendGeneralGrud] = []
    var ListContactPostCopia:[GeneralUsuario] = []
    var contactsSend:[PhoneItemRequest] = [];
    var currentIndex = 0;
    var contador = -1;
    let extractedExpr: HomeViewCase = HomeViewCase()
    
    var loadingInser:Bool = false;
    
    
    @Published var noContacts:Bool = false;
    @Published var textFiltrer:String = "";
    
    @Published var loading:Bool = false;
    var denegado = 0;
    
    var contacts = [Contact]()
    
    init() {
    
        //self.getAllContactLocalv2()
    }
    
    func filter(text:String){
        //ListContactPostZ
        self.ListContactPostZ = self.ListContactPostZCopia;
        if(text == ""){return}
       // self.contactsSend = self.ListContactPostCopia.filter {$0.name == text}
        self.ListContactPostZ = [];
        var cont = 0;
        self.ListContactPostZCopia.forEach({contact in
        var name:String =  contact.usua.contact?.name ?? self.contactsSend[contact.usua.i ?? 0].name;
  
            if(  name.lowercased().range(of: text.lowercased()) != nil  ){
                var f : SendGeneralGrud = SendGeneralGrud(num: cont, usua: contact.usua)
                self.ListContactPostZ.append(f)
                cont = cont + 1;
            }
            
        })
     
        
    }
    
    func seeNameContact()->String{
        var name:String = "prueba";
        
        //if(self.contador =)
        //self.contador = self.contador + 1;
        //name = self.contactsSend[self.contador].name
        
        return name;
    }
    
    
    /*func getUser() {
        //Cargar contactos
        self.loading = true;
//<<<<<<< Updated upstream
//        HomeViewCase().ListApp(phones: self.contactsSend, currentIndex: currentIndex){ response in
//            self.ListContactPost = response.data.data;
//            self.ListContactPostCopia =  response.data.data;
//=======
        HomeViewCase().ListApp(phones: self.contactsSend, currentIndex: 0){ response in
            self.ListContactPost = response.data;
            self.ListContactPostCopia =  response.data;
//Stashed changes
            self.noContacts =  false;
            
            var count = 0;
            print("PAGINA \(self.currentIndex)")
            self.ListContactPostCopia.forEach({lits in
                var f : SendGeneralGrud = SendGeneralGrud(num: count, usua: lits)
                self.ListContactPostZ.append(f);
                count = count+1;
            })
            
            if(count == 0 && self.ListContactPostCopia.count == 0){
                // Delay of 7.5 seconds
                 DispatchQueue.main.asyncAfter(deadline: .now() + 30.5) {
                    self.getUser()
                   }
            }
            
            self.ListContactPostZCopia = self.ListContactPostZ;
           print(response)
            self.loading = false;
        } onDefault: { response in
           
            print(response)
            
        } onError: { error in
     
            print(error)
            
        }
    }*/
    
    
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
            if(self.contactsSend.count > 0){
                self.loading = false
            } else {
                self.loading = true
            }
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
        self.contador = -1;
        //self.loading = false;
        DispatchQueue.main.async {
          
            print("Hola llego aca")
            print(self.Contactos.contacts);
            if(self.contacts.isEmpty){
                self.noContacts =  true;
                return ;
            }
            var auxContacts:[PhoneItemRequest] = [];
            
            self.contacts.forEach({contact in
                //let cont = nil
                if(contact.phoneNumbers.count != 0 && !contact.firstName.isEmpty){
                    let number = self.formatContact(number:contact.phoneNumbers[0]) ;
                    let name = contact.firstName;
                    
                    
                    let contacto:PhoneItemRequest = PhoneItemRequest(phone: DataApp.formatNumberPhone(phone: number) , name: name);
                    auxContacts.append(contacto);
                }
          
            })
            self.contactsSend = auxContacts;
           // print(self.contactsSend)
            //INSERT CONTACOTS
            print("antes de consulta")
            self.ListContactPostZCopia = []
            
            self.extractedExpr.InsertListApp(phones: self.contactsSend){ response in
                self.contador = 0
                print("respuesta de la consulta")
                self.ListContactPost = response.data;
                self.ListContactPostCopia =  response.data;
                
                self.noContacts =  false;
                var auxListContactApi:[SendGeneralGrud] = []
                var count = 0;
                self.ListContactPostCopia.forEach({lits in
                    var f : SendGeneralGrud = SendGeneralGrud(num: count, usua: lits)
                    auxListContactApi.append(f);
                    //self.ListContactPostZ.append(f);
                    self.ListContactPostZCopia.append(f)
                    count = count+1;
                })
                print("final del recorrido de la consulta")
                print(count)
                self.ListContactPostZ = auxListContactApi
                self.loadingInser = true;
                self.loading = false;
            } onDefault: { response in
               
                print(response)
                print("dafault desconocido")
                
            } onError: { error in
         
                print(error)
                print("error desconocido")
                
            }
            
            //self.getUser()
        }
    }

}
