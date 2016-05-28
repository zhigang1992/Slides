//
//  Functions.swift
//  Slides
//
//  Created by Kyle Fang on 5/28/16.
//  Copyright © 2016 Kyle Fang. All rights reserved.
//

import UIKit

infix operator |> { associativity left precedence 110 }
func |> <A, B> (l: A, r: A -> B) -> B {
    return r(l)
}

func |> <A, B, C> (l: A->B, r: B->C) -> A-> C {
    return { a in
        r(l(a))
    }
}