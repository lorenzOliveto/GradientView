//
//  GradientView.swift
//  GradientView
//
//  Created by Lorenzo Oliveto on 09/03/18.
//  Copyright © 2018 Mumble. All rights reserved.
//

import UIKit

open class GradientView: UIView {
    private var gradientLayer: CAGradientLayer!
    
    open var colors: [Any]? {
        didSet {
            self.gradientLayer.colors = colors
        }
    }
    
    /* The start and end points of the gradient when drawn into the layer's
     * coordinate space. The start point corresponds to the first gradient
     * stop, the end point to the last gradient stop. Both points are
     * defined in a unit coordinate space that is then mapped to the
     * layer's bounds rectangle when drawn. (I.e. [0,0] is the bottom-left
     * corner of the layer, [1,1] is the top-right corner.) The default values
     * are [.5,0] and [.5,1] respectively. Both are animatable. */
    open var startPoint: CGPoint? {
        didSet {
            if let startPoint = startPoint {
                self.gradientLayer.startPoint = startPoint
            } else {
                self.gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            }
        }
    }
    
    open var endPoint: CGPoint? {
        didSet {
            if let endPoint = endPoint {
                self.gradientLayer.endPoint = endPoint
            } else {
                self.gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
            }
        }
    }
    
    // MARK: - Initializers
    
    /**
     Initializes the view with a frame and an array of colors for the gradient.
     
     - Parameter frame:   The frame for the view.
     - Parameter colors: The colors of the gradient.
     
     */
    convenience init(frame: CGRect, colors: [Any]) {
        self.init(frame: frame, colors: colors, startPoint: nil, endPoint: nil)
    }
    
    /**
     Initializes the view with a frame, an array of colors for the gradient and the start and end point of the gradient.
     
     - Parameter frame:   The frame for the view.
     - Parameter colors: The colors of the gradient.
     - Parameter startPoint: The startPoint of the gradient.
     - Parameter endPoint: The endPoint of the gradient.
     
     */
    convenience init(frame: CGRect, colors: [Any], startPoint: CGPoint?, endPoint: CGPoint?) {
        self.init(frame: frame)
        self.colors = colors
        self.startPoint = startPoint
        if let endPoint = endPoint {
            self.endPoint = endPoint
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initGradientLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initGradientLayer()
    }
    
    private func initGradientLayer() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.bounds
        
        if let colors = self.colors {
            self.gradientLayer.colors = colors
        }
        
        self.layer.masksToBounds = true
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    // MARK: - Layout
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = self.gradientLayer {
            gradientLayer.frame = self.bounds
        }
    }
    
    /**
     Set the start and end point of the gradient.
     - Parameter startPoint:   start point.
     - Parameter endPoint:   end point.
     */
    open func set(startPoint: CGPoint, endPoint: CGPoint) {
        self.gradientLayer.startPoint = startPoint
        self.gradientLayer.endPoint = endPoint
    }
}

open class VerticalGradientView: GradientView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        set(startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        set(startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
    }
    
    convenience init(frame: CGRect, colors: [Any], startPoint: CGPoint?, endPoint: CGPoint?) {
        self.init(frame: frame)
        self.colors = colors
        self.startPoint = startPoint ?? CGPoint(x: 0.5, y: 0)
        if let endPoint = endPoint {
            self.endPoint = endPoint
        } else {
            self.endPoint = CGPoint(x: 0.5, y: 1)
        }
    }
}
