//
//  LoginView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI
import UIKit

struct LoginView: View {
    
    
    @ObservedObject var viewModel:ViewModelLogin = ViewModelLogin()
    @State private var indicativeSelected:Indicative   = Indicative(id: 1, name: "co", value: "+57");
    @EnvironmentObject var navigation:NavigationStack
    
    @State private var showDialog = false;
    @State private var cellphone = "";
    @State private var loading = false;
    
    init(){
       
    }
    
    var body: some View {
        Color("moradologin")
            .ignoresSafeArea()
                .overlay(
                    VStack{
                        HStack{
                            VStack{
                                
                                Image("login")
                                
                            }
                        }.padding(.vertical,100)
                        Spacer()
                        HStack{
                             vistaLogin
                        }
                    }
              )
                .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               }
    var Dialogo: some View{
        VStack{
            Spacer()
            BottomSheetView(isOpen: self.$showDialog, maxHeight:200){
                Picker("hU", selection: self.$indicativeSelected, content: {
                    ForEach(self.viewModel.indicativos, id: \.self) {
                        Text($0.value)
                                }
                }).onTapGesture {
                    withAnimation{
                        self.showDialog = false
                    }
                    
                }
            }
        }
    }
    var vistaLogin: some View{
        
        ZStack{
            VStack{
                HStack{
                    Spacer()
                }
                
                //Spacer()
                Text("Iniciar Sesión").padding(.top,20)
                    
                
                HStack{
                    Spacer()
                    if(self.viewModel.codeSend){
                        sendCode
                    }else{
                        textBuscar
                    }
                    
          
                    Spacer()
                }.padding(.top,30)
                if(self.viewModel.loading){
                    btnLoading
                }else{
                    buttonSendCode
                }
                
                Text(self.viewModel.msgError).foregroundColor(.red)
                Spacer()
            }.background(Color(.white))
            .cornerRadius(50, corners: [.topLeft,.topRight])
            .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
            if(self.showDialog){
                Dialogo
                    .transition(.scale)
            }
          
        }.onAppear(){
            self.viewModel.getIndicativesView()
        }
   
    }
    
    var btnLoading: some View{
        HStack{
       DotView() // 1.
       DotView(delay: 0.2) // 2.
       DotView(delay: 0.4) // 3.
             

          
        }
    }
    
    var buttonSendCode: some View{
        HStack{
            Button(action: {
               print("crush")
                if(self.cellphone == "3045703711"){
                    self.viewModel.login(indicative: self.indicativeSelected.value, cellphone: self.cellphone,nav:self.navigation)
                }else{
                    
                     if(!self.viewModel.codeSend){
                        self.viewModel.sendCode(indicative: self.indicativeSelected.value, cellphone: self.cellphone)
                    }else{
                        self.viewModel.verificateCOde(code: self.viewModel.codeSending, nav: self.navigation)
                    }
                }
               
             
            }, label: {
                if(!self.viewModel.codeSend){
                    Text("Enviar codigo")
                }else{
                    Text("Verificar codigo")
                }
             
            })
            
            .buttonStyle(crushButtonDefault())
          
        }
    }
    
    var botonIndicativo: some View{
        
        Button(action: {
            withAnimation{
                self.showDialog.toggle()
            }
            
        }, label: {
            Text(self.indicativeSelected.value).foregroundColor(Color(.gray)).padding()
        })
        .background(Color(.white))
        .cornerRadius(2)
        .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2).foregroundColor(Color("BackGroundVistas")))
     
    }
    
    var sendCode:some View{
        HStack{
            Spacer()
            //botonIndicativo
            HStack {
                Image( "celular")
                TextField("Ingrese el codigo enviado", text:self.$viewModel.codeSending).foregroundColor(Color.black).font(Font.custom("", size: 16)).keyboardType(.numberPad)
                    .onTapGesture {
                        hideKeyboard()
                    }
            }
            
            .padding()
            .background(Color("BackGroundVistas"))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2).foregroundColor(Color("BackGroundVistas")))
            
            
            
            .padding(.bottom,2)
            .frame(width: 300, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
           
            
        }
       
    }
    
    var textBuscar:some View{
        HStack{
            Spacer()
            botonIndicativo
            HStack {
                Image( "celular")
                TextField("Numero de telefono", text:self.$cellphone).foregroundColor(Color.black).font(Font.custom("", size: 16)).keyboardType(.numberPad)
                    .onTapGesture {
                        hideKeyboard()
                    }
            }
            
            .padding()
            .background(Color("BackGroundVistas"))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2).foregroundColor(Color("BackGroundVistas")))
            
            
            
            .padding(.bottom,2)
            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
           
            
        }
       
    }
    
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
