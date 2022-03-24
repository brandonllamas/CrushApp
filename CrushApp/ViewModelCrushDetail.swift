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
    @Published var AccionesCrush:[GeneralResponseActionsRes] = []
    @State var load:Bool = false;
    @Published var arrayActionActive:[Int] = []

    init(id:Int) {
        self.id = id;
      
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
//        nav.advance(AnyView(CrushDetailView()), tag: .CrushDetailView)
        UserCaseDetailCrush().GetDetailUser(ids: self.id){response in
            self.images = response.data.data.gallery ?? []
            self.load.toggle();
            var arrayActionActivelocal = response.data.data.sended_match ?? []
            
            arrayActionActivelocal.forEach({response in
                self.arrayActionActive.append(response.id_action)
                
            })
            //self.arrayActionActive.append(response.data.data.sended_match)
            self.getActions()
            print(response)
        } onDefault: { response in
            print(response)
        } onError: { error in
            print(error)
        }
    }
    
    
    func getActions(){
        //self.AccionesCrush = []
  //        nav.advance(AnyView(CrushDetailView()), tag: .CrushDetailView)
          UserCaseDetailCrush().GetActionsList(){response in
            self.AccionesCrush = response.data.data
             // self.load.toggle();
              print(response)
          } onDefault: { response in
             
              print(response)
              
          } onError: { error in
       
              print(error)
              
          }
    }
    
    
    func addActionM(action:Int) {
        UserCaseDetailCrush().addAction(id_user:self.id,id_action: action){response in
            self.arrayActionActive.append(action)
            self.getActions()
            
          } onDefault: { response in
             
              print(response)
              
          } onError: { error in
       
              print(error)
              
          }
    }
    
    
    
    
    
}
