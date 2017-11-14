//
//  Transitions.swift
//  OramaTest
//
//  Created by Luis Felipe Tapajos on 14/11/17.
//  Copyright © 2017 Luis Felipe Tapajos. All rights reserved.
//

import UIKit

class Transitions: CATransition {
    
    func transitionFromRight() -> CATransition {
    
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        
        return transition
    }
    
    func transitionFromLeft() -> CATransition {
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        return transition
    }
    
    func transitionFromBottom() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        
        return transition
    }
    
    func transitionFromTop() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        
        return transition
    }
}
