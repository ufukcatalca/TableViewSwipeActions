//
//  Todo.swift
//  SwipeActions
//
//  Created by Horizon on 18.10.2018.
//  Copyright © 2018 Horizon. All rights reserved.
//

import Foundation

final class Task {
    
    let title         : String
    let date          : Date
    let isSignificant : Bool
    let isDone        : Bool
    
    init(title:String) {
        
        self.title         = title
        self.date          = Date()
        self.isSignificant = false
        self.isDone        = false
        
    }
}
