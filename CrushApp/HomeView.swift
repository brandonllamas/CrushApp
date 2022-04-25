//
//  HomeView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 7/03/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel:ViewModelHome
        = ViewModelHome();
    
    @State var dialogs:Bool = true;
    
    
    let columns = [
       
        GridItem(.flexible(),spacing: 5),
        GridItem(.flexible() ,spacing: 10),
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                textBuscar
                
                ScrollView {
                    VStack(spacing: 20) {
                        if(self.viewModel.loading){
                            loading
                        }else{
                            grid
                        }
                    }.frame(width: .infinity, height: .infinity, alignment: .center)
                }
                
                Spacer()
                if(self.dialogs){
                    dialog
                }
            }.navigationBarTitle("")
                .navigationBarHidden(true)
            .background(Color(.white))
          
            .customDialog(isShowing: self.$viewModel.noContacts){
                DialogNoContent.background(Color(.white))
                    .cornerRadius(30)
             }
            .frame(width: .infinity, height: .infinity, alignment: .center)
            
        }.onAppear{
            self.viewModel.getAllContactLocalv2()
        }.frame(width: .infinity, height: .infinity, alignment: .center)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    var dialog:some View{
        VStack{
            HStack{
             Spacer()
                Text("X").onTapGesture {
                    self.dialogs = false
                }
            }.padding(.horizontal,10)
            .padding(.bottom,10)
            HStack{
                HStack{
                    Text("Parece que varios de tus contactos aún no han descargando Crush. Prueba a hacer Match con ellos ( será nuestro secreto por supuesto ) y nosotros les invitaremos a descargar la app. También puedes invitarles desde el menú configuración -> invitar a amigos").foregroundColor(.white)
                        .font(.custom("", fixedSize: 15))
                        .multilineTextAlignment(.center)
                }.padding(.horizontal,10)
            }
        }
        
       
        .frame(width: .infinity, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color("ColorConfAzul"))
        .cornerRadius(20, corners: [.topLeft,.topRight])
       
    }
    
    var loading:some View{
        VStack{
            HStack{
                DotView() // 1.
                DotView(delay: 0.2) // 2.
                DotView(delay: 0.4) // 3.
            }
        }
    }
    
    
    var DialogNoContent:some View{
        VStack {
            Text("Acceso contactos Denegado")
                  .padding(.bottom, 10)
             
            Divider()
            Text("Permisos de acceso a \n contactos denegados")
                //.font(.system(size: 20))
              //.minimumScaleFactor(0.01)
            
            Divider()
            HStack{
                
                Button(action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }) {
                  Text("Ir a ajustes")
                    .foregroundColor(Color(.blue))
                    .autocapitalization(.allCharacters)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                }
            }
      }.padding()
    }
    
    var grid:some View{
        HStack{
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 20) {
                //var num = 0;
                ForEach(self.viewModel.ListContactPostZ, id: \.self) { homePeople in
                 
                    NavigationLink(destination:
                                    CrushDetailView(user: homePeople.usua)
                                    ){
                        
                        ItemPersonaHome(user: homePeople.usua,num: homePeople.num)
                           
                            .background(Color.white)
                       
                    } .background(Color.white)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                     
                    
                }
             }.padding(.horizontal)
            Spacer()
        }.frame(width: .infinity, height: .infinity, alignment: .center)
     
        
    }
    
    var textBuscar:some View{
        HStack{
            Spacer()
            HStack {
                Image( "search")
                TextField("Buscar por nombre", text: self.$viewModel.textFiltrer).foregroundColor(Color.gray).font(Font.custom("", size: 16))
                    .onChange(of: self.viewModel.textFiltrer) { newValue in
                       print("Name changed to \(self.viewModel.textFiltrer)!")
                        self.viewModel.filter(text: self.viewModel.textFiltrer)
                     }
                   
            }
            
            .padding()
            .background(Color(.white))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 2).foregroundColor(Color("SoftGradient1")))
            
            
            .padding(.horizontal,50)
            .padding(.bottom,2)
            .padding(.top,15)
            Spacer()
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
