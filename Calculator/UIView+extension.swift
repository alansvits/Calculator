//
//  UIView+extension.swift
//  Calculator
//
//  Created by Stas Shetko on 1/06/18.
//  Copyright © 2018 Stas Shetko. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    
}

@IBDesignable
class DesignableButton: UIButton {
    
}

@IBDesignable
class DesignableLabel: UILabel {
    
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

}
