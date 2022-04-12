//
//  ListNotificationView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 28/03/22.
//

import SwiftUI

struct ListNotificationView: View {
    @ObservedObject var viewModel:ListNotificationViewModel;
     
    init(){
        self.viewModel = ListNotificationViewModel()
    }
   @State var tabActive:Int = 0
    
    var body: some View {
        ZStack{
            degradado
            vista
           
        }.onAppear(){
           
        }
    }
    
    var vista:some View{
        VStack{
            tabs.padding(.top,10)
            
            ScrollView{
                VStack{
                    if(tabActive == 0){
                        ForEach(self.viewModel.notificationsCrush, id: \.self){ action in
                            ItemViewNotification(title: "Tienes un match!", msg: action.value.message, date: action.value.date,ref: action.value.ref, funcs: {self.viewModel.delete(ref: action.value.ref )})
                                .padding(14)
                           }
                     
                    }else{
                        ForEach(self.viewModel.notifications, id: \.self){ action in
                            ItemViewNotification(title: "Tienes un crush!", msg: action.value.message, date: action.value.date,ref: action.value.ref,funcs:{ self.viewModel.delete(ref: action.value.ref )})
                                .padding(14)
                           }
                    }
                }.frame(height:.infinity)
            }
            Spacer()
        }
    }
    
    var tabs:some View{
        HStack{
            Spacer()
            Button(action: {
                self.tabActive = 0
                self.viewModel.getCrushes()
            }, label: {
                VStack{
                    Text("Mis Matches").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    if(self.tabActive == 0){
                        Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                 
                }
                
            }).foregroundColor( self.tabActive == 0 ? Color("SoftGradient1") : Color.gray)
            
            Spacer()
            Button(action: {
                self.tabActive = 1
                
                self.viewModel.getNotification()
            }, label: {
                VStack{
                    Text("Mis Notificaciones").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    if(self.tabActive == 1){
                        Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                 
                }
                
            }).foregroundColor( self.tabActive == 1 ? Color("SoftGradient1") : Color.gray)
            Spacer()
        }.padding(.top,5)
    }
    
    
    var degradado: some View{
        LinearGradient(gradient: Gradient(colors: [
            Color("Cian-1").opacity(0.9),
            Color("AzulDegradado-1").opacity(0.9),
            Color("Magneta-1").opacity(0.9)
           
        ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct ListNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ListNotificationView()
    }
}
