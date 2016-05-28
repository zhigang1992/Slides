//
//  Modifiable.swift
//  Slides
//
//  Created by Kyle Fang on 5/28/16.
//  Copyright © 2016 Kyle Fang. All rights reserved.
//

import Foundation

protocol Modifiable: class {}

extension Modifiable {
    static func modify(modification: Self -> Void) -> Self -> Self {
        return { instance in
            modification(instance)
            return instance
        }
    }
}

extension NSObject: Modifiable {}