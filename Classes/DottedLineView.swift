//
//  DottedLineView.swift
//  虚线
//
//  Created by test on 2021/11/18.
//

import UIKit

class DottedLineView: UIView {

    var  border = CAShapeLayer()
    @IBInspectable
    var rounded: Bool  = false
    @IBInspectable
    var middle: Bool  = false
    
    //虚线长度
    @IBInspectable
    var dottedLength: Int  = 5
    //虚线高度
    @IBInspectable
    var lineWidth: CGFloat  = 1
    
    //虚线间隔
    @IBInspectable
    var dottedInterval: Int  = 5
    
    @IBInspectable
    var strokeColor: UIColor  = UIColor.clear
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        drawLine()

    }
    
    
    //MARK:- 绘制虚线
    func drawLine() {
        border.removeFromSuperlayer()
        border.strokeColor = self.strokeColor.cgColor
        border.fillColor = UIColor.clear.cgColor
        var path = UIBezierPath()
        if rounded {
            //周边虚线
          path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius)
            border.lineWidth = lineWidth

        }else if middle {
            path.move(to: CGPoint(x: 0, y: self.bounds.height/2.0))
            path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height/2.0))
            border.lineWidth = self.bounds.height
        }
        border.path = path.cgPath
        border.frame = self.bounds
        border.lineDashPattern = [NSNumber(value: dottedLength),NSNumber(value: dottedInterval)]
        self.layer.addSublayer(border)

    }
    



}
