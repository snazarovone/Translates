//
//  ModalDismissAnimator.swift
//  Translates
//
//  Created by Sergey Nazarov on 27.09.2021.
//  
//

import Foundation
import UIKit

class ModalDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let vc = transitionContext.viewController(forKey: .from),
            let backgroundView = (vc as? ModalAnimatable)?.animatedBackgroundView,
            let movingView = (vc as? ModalAnimatable)?.animatedMovingView
        else {
            return
        }
        
        transitionContext.containerView.addSubview(vc.view)
        let finalFrame = transitionContext.finalFrame(for: vc)
        
        let originalFrame = movingView.frame
        var movingFrame = originalFrame
        movingFrame.origin.y = finalFrame.maxY
        
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(
            withDuration: duration,
            animations: {
                backgroundView.alpha = 0
                movingView.frame = movingFrame
            },
            completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        )
    }    
}
