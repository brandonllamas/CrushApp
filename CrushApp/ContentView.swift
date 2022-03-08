//
//  ContentView.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import SwiftUI

struct ContentView: View {
    var navigation:NavigationStack
    
    init(){
        self.navigation = NavigationStack(NavigationItem( view: AnyView(SplashScreenView()), tag: .SplashScreen))
    }
    
    var body: some View {
        NavigationHost()
        .environmentObject(self.navigation)
        .environmentObject(ModalManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
