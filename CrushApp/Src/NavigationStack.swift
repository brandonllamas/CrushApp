//
//  NavigationStack.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import SwiftUI


final class NavigationStack: ObservableObject {
    
    enum FlagType {
        case singleInTop
        case clearTop
    }
    
    @Published var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem
    
    init(_ currentView: NavigationItem ){
        self.currentView = currentView
    }
    
    func unwind(){
        if viewStack.count == 0{
            return }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    //Recibe un navigation Item
    func advance(_ view:NavigationItem){
        viewStack.append( currentView)
        currentView = view

    }
    
    //Recibe una view EASIER
    func advance(_ anyview:AnyView, tag:Views){
        viewStack.append( currentView)
        let newview : NavigationItem = NavigationItem(view: anyview, tag: tag)
        currentView = newview
    }
    
    func advanceNewTask(_ view:NavigationItem){
        viewStack.removeAll()
        viewStack.append(currentView)
        currentView = view
    }
    
    func advance(_ anyview:AnyView, tag:Views, flag:FlagType){
        switch flag {
        case .singleInTop:
            viewStack.append(currentView)
            
            let newview : NavigationItem = NavigationItem(view: anyview, tag: tag)
            let index = viewStack.lastIndex(where: { element -> Bool in
                return element.tag == newview.tag
            })
            if index != nil {
                viewStack.remove(at: index!)
            }
            currentView = newview
            
        case .clearTop:
            viewStack.append(currentView)
            let newview : NavigationItem = NavigationItem(view: anyview, tag: tag)
            let index = viewStack.lastIndex(where: { element -> Bool in
                return element.tag == newview.tag
            })
            if index != nil {
                let range = index!...(viewStack.count-1)
                viewStack.removeSubrange(range)
            }
            currentView = newview
        }

    }
    

    
    @available(iOS 15.0, *)
    func home(){
        currentView = NavigationItem(view: AnyView(LoginView()), tag: .Login)
        viewStack.removeAll()
    }
    
}


struct NavigationItem{
    
    var view:AnyView
    var tag:Views
}

struct NavigationHost: View{
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        self.navigation.currentView.view
    }
}

