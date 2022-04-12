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
        GridItem(.flexible()),
        GridItem(.fixed(10))
    ]
    
    //var notifications:NotificationResponseGeneral;
    var title:String = "";
    var msg:String = "";
    var date:String = ""  ;
    var ref:String = "";
    
    @ObservedObject var viewModel:ItemViewModelNotification;
    
    var function: () -> Void
    
    init(title:String,msg:String,date:String,ref:String,funcs: @escaping () -> Void){
       // self.notifications = not
        self.title =  title
        self.msg = msg
        //self.date = date
        self.ref = ref
        self.viewModel = ItemViewModelNotification()
        self.function = funcs
      
        
        var datesplit = date.split(separator: "T")
        var fech = datesplit[0].split(separator: "-")
        self.date = "\(fech[0])/\(fech[1])/\(fech[2])"
    }
    var body: some View {
        VStack{
            if(self.viewModel.verlo){
                cuerpo
            }
        }
    }
    
    
    var cuerpo: some View {
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
                    
                    HStack{
                        VStack(spacing:3){
                            Image("trash-can")
                                .resizable()
                                .padding(.vertical,3)
                                .padding(.horizontal,9)
                                .frame(width: 30, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .onTapGesture {
                                    //self.viewModel.delete(ref: self.ref)
                                    self.function()
                                }
                            Spacer()
                        }.padding(3)
                    }
                }
            }.padding(.horizontal,15)
            Spacer()
        }.frame(width: 326, height: 88, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.white)
        .cornerRadius(16.77)
    }
}

 
