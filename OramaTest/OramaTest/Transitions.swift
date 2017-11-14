//
//  Transitions.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 14/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class Transitions: CATransition {
    
    //Trasição de abertura para a direita
    func transitionFromRight() -> CATransition {
    
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        return transition
    }
    
    //Trasição de fechamento para a esquerda
    func transitionFromLeft() -> CATransition {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        return transition
    }
    
    //Transição de abertura para baixo
    func transitionFromBottom() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        
        return transition
    }
    
    //Transição de fechamento para cima
    func transitionFromTop() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        
        return transition
    }
}
