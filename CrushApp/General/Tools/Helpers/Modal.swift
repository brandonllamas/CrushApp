//
//  Modal.swift
//  CrushApp
//
//  Created by WebAuxiliar on 5/03/22.
//

import Foundation
import SwiftUI

enum ModalState: CGFloat {
    
    case closed ,partiallyRevealed, open, short, largeshort
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height
        case .partiallyRevealed:
            return UIScreen.main.bounds.height * 1/4
        case .short:
            return UIScreen.main.bounds.height * 1/2
        case .largeshort:
            return UIScreen.main.bounds.height * 3/4
        case .open:
            return 0
        }
    }
}

struct Modal {
    var position: ModalState  = .closed
    var dragOffset: CGSize = .zero
    var content: AnyView?
}

struct CustomDialog<DialogContent: View>: ViewModifier {
  @Binding var isShowing: Bool // set this to show/hide the dialog
  let dialogContent: DialogContent

  init(isShowing: Binding<Bool>,
        @ViewBuilder dialogContent: () -> DialogContent) {
    _isShowing = isShowing
     self.dialogContent = dialogContent()
  }

  func body(content: Content) -> some View {
   // wrap the view being modified in a ZStack and render dialog on top of it
    ZStack {
      content
      if isShowing {
        // the semi-transparent overlay
        Rectangle()
            .frame(width: .infinity, height: .infinity, alignment: .center)
            .foregroundColor(Color.black.opacity(0.6))
           
        // the dialog content is in a ZStack to pad it from the edges
        // of the screen
        ZStack {
          dialogContent
            .background(
              RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.black.opacity(0.004)))
        }.padding(40)
      }
    }
  }
}

extension View {
  func customDialog<DialogContent: View>(
    isShowing: Binding<Bool>,
    @ViewBuilder dialogContent: @escaping () -> DialogContent
  ) -> some View {
    self.modifier(CustomDialog(isShowing: isShowing, dialogContent: dialogContent))
  }
}





struct CustomDialogNofondo<DialogContent: View>: ViewModifier {
  @Binding var isShowing: Bool // set this to show/hide the dialog
  let dialogContent: DialogContent

  init(isShowing: Binding<Bool>,
        @ViewBuilder dialogContent: () -> DialogContent) {
    _isShowing = isShowing
     self.dialogContent = dialogContent()
  }

  func body(content: Content) -> some View {
   // wrap the view being modified in a ZStack and render dialog on top of it
    ZStack {
      content
      if isShowing {
        // the semi-transparent overlay
        Rectangle().foregroundColor(Color.black.opacity(0.6))
        // the dialog content is in a ZStack to pad it from the edges
        // of the screen
        ZStack {
          dialogContent
            .background(
              RoundedRectangle(cornerRadius: 8)
                //.foregroundColor(.white)
                .foregroundColor(Color.black.opacity(0.6))
            )
        }.padding(40)
      }
    }
  }
}

extension View {
  func CustomDialogNofondo<DialogContent: View>(
    isShowing: Binding<Bool>,
    @ViewBuilder dialogContent: @escaping () -> DialogContent
  ) -> some View {
    self.modifier(CustomDialog(isShowing: isShowing, dialogContent: dialogContent)).foregroundColor(Color.black.opacity(0.6))
  }
}
