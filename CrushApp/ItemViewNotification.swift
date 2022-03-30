//
//  ItemViewNotification.swift
//  CrushApp
//
//  Created by WebAuxiliar on 30/03/22.
//

import SwiftUI

struct ItemViewNotification: View {
    
    let columns = [
        GridItem(.fixed(10)),
        GridItem(.flexible())
    ]
    
    //var notifications:NotificationResponseGeneral;
    var title:String = "";
    var msg:String = "";
    var date:String = "";
    
    init(title:String,msg:String,date:String){
       // self.notifications = not
        self.title =  title
        self.msg = msg
        self.date = date
    }
    
    
    var body: some View {
        VStack(spacing:10){
            Spacer()
            HStack{
                LazyVGrid(columns: columns, spacing: 2) {
                    HStack{
                        VStack(spacing:3){
                            Circle().foregroundColor(Color.green)
                                .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                            Spacer()
                        }.padding(3)
                    }
                    HStack{
                        
                        VStack(alignment:.leading){
                            Text(self.title).foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                            Text(self.date).foregroundColor(Color.gray).font(.system(size: 11))
                            Text(self.msg).foregroundColor(Color.gray)
                                .font(.system(size: 12))
                            
                            
                        }
                        Spacer()
                    }
                }
            }.padding(.horizontal,15)
            Spacer()
        }.frame(width: 326, height: 88, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.white)
        .cornerRadius(16.77)
    }
}

 
