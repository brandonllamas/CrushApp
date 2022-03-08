//
//  ModalManager.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation

import SwiftUI

class ModalManager: ObservableObject {
    
    @Published var modal: Modal = Modal(position: .closed, content: nil)
    
    func newModal<Content: View>(position: ModalState, @ViewBuilder content: () -> Content ) {
        modal = Modal(position: position, content: AnyView(content()))
    }
    
    func openModal(position:ModalState) {
        modal.position = position
    }
    
    func closeModal() {
        modal.position = .closed
    }
    
    func destroyModal(){
        self.modal = Modal(position: .closed, content: nil)
    }
    
}
