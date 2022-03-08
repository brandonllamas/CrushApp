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
