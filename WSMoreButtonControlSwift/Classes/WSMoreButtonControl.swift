//
//  WSMoreButtonControl.swift
//  WSMoreButtonControl
//
//  Created by WebsoftProfession on 14/02/23.
//

import UIKit



public enum WSDotStyle: Int {
    case fill = 0
    case stroke = 1
}


public class WSMoreButtonControl: UIView {
    
    
    private var path1: WSDrawViewBottom!
    private var path2: WSDrawViewTop!
    
    public var isOpen: Bool = false
    
    public var moreClicked = { (isOpen: Bool)  in
        
    }
    
    var style:WSDotStyle = .fill
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) {
        // Drawing code
        if path1 == nil {
            path1 = WSDrawViewBottom.init(frame: rect)
            path1.backgroundColor = .clear
            path1.style = self.style
            path2 = WSDrawViewTop.init(frame: rect)
            path2.backgroundColor = .clear
            path2.style = self.style
            self.addSubview(path1)
            self.addSubview(path2)
        }
    }
    
    func toggleMoreControl(){
        isOpen.toggle()
        
        let spinAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        spinAnimation.fillMode = .forwards
        spinAnimation.isRemovedOnCompletion = false
        spinAnimation.speed = 0.4
        spinAnimation.isCumulative = true
        spinAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        
        let spinAnimation2 = CABasicAnimation.init(keyPath: "transform.rotation")
        spinAnimation2.fillMode = .both
        spinAnimation2.isRemovedOnCompletion = false
        spinAnimation2.speed = 0.4
        spinAnimation2.timingFunction = CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        spinAnimation2.isCumulative = true
        self.path1.layer.removeAnimation(forKey: "spinAnimation")
        self.path2.layer.removeAnimation(forKey: "spinAnimation1")
        
        if isOpen {
            spinAnimation.toValue = NSNumber(value: 2.0 * 1.12 * .pi)
            spinAnimation2.toValue = NSNumber(value: 1.0 * 0.75 * .pi)
            
        }
        else{
            spinAnimation.toValue = NSNumber(value: -2.0 * 1 * .pi)
//            spinAnimation2.toValue = NSNumber(value: -1.0 * 1 * .pi)
        }
        self.path1.layer.add(spinAnimation, forKey: "spinAnimation")
        self.path2.layer.add(spinAnimation2, forKey: "spinAnimation1")
        self.moreClicked(isOpen)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.toggleMoreControl()
    }
    
}

fileprivate class WSDrawViewBottom: UIView {
    
    var style:WSDotStyle = .fill
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let ratio = rect.width * 0.15
        let insetRect = rect.inset(by: .init(top: ratio, left: ratio, bottom: ratio, right: ratio))
        let circleTop1 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.minX, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        let circleTop2 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.midX - ratio / 2, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        let circleTop3 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.maxX - ratio, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        
        path.append(circleTop1)
        path.append(circleTop2)
        path.append(circleTop3)
        
        if self.style == .fill {
            self.tintColor.setFill()
            path.fill()
        }
        else{
            self.tintColor.setStroke()
            path.stroke()
        }

    }
}

fileprivate class WSDrawViewTop: UIView {
    
    var style:WSDotStyle = .fill
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let ratio = rect.width * 0.15
        let insetRect = rect.inset(by: .init(top: ratio, left: ratio, bottom: ratio, right: ratio))
        let circleTop1 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.minX, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        let circleTop2 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.midX - ratio / 2, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        let circleTop3 = UIBezierPath.init(ovalIn: CGRect.init(x: insetRect.maxX - ratio, y: insetRect.midY - ratio / 2, width: ratio, height: ratio))
        
        path.append(circleTop1)
        path.append(circleTop2)
        path.append(circleTop3)
        if self.style == .fill {
            self.tintColor.setFill()
            path.fill()
        }
        else{
            self.tintColor.setStroke()
            path.stroke()
        }
    }
}
