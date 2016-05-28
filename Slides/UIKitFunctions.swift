//
//  UIKitFunctions.swift
//  Slides
//
//  Created by Kyle Fang on 5/28/16.
//  Copyright © 2016 Kyle Fang. All rights reserved.
//

import Foundation

extension UIColor {
    convenience public init(_ hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

func useTitle(text: String) -> UILabel -> UILabel {
    return UILabel.modify { $0.text = text }
}

func useFont(font: UIFont) -> UILabel -> UILabel {
    return UILabel.modify { $0.font = font }
}

func useTextColor(color: UIColor) -> UILabel -> UILabel {
    return UILabel.modify { $0.textColor = color }
}

func useAdjustsFontSizeToFitWidth(adjustsFontSizeToFitWidth: Bool) -> UILabel -> UILabel {
    return UILabel.modify { $0.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth }
}

func useContentMode<T: UIView>(cm: UIViewContentMode) -> T -> T {
    return {
        $0.contentMode = cm
        return $0
    }
}

func useImage(image: UIImage) -> UIImageView -> UIImageView {
    return UIImageView.modify {$0.image = image}
}

func useBackgroundColor(color: UIColor ) -> UIView -> UIView {
    return UIView.modify { $0.backgroundColor = color }
}

func useLines(lines: Int) -> UILabel -> UILabel {
    return UILabel.modify { $0.numberOfLines = lines }
}

let useMultipleLines = useLines(0)