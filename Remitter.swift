//
//  Remitter.swift
//  Pods-remitter_Example
//
//  Created by Yasin Akbaş on 22.10.2019.
//

import UIKit

enum RemitterOffset {
    case zero
    case normal
}

/// this view has to be heigher (y) coordinate than main view if you want this like snow you can use offset for this or use normal remitter type
public class Remitter {
    
    private var remitter: RemitterView?
    private var baseView: UIView

    /// create remitter view with default properties in this view with custom offset or without
    init(in view: UIView, offset: CGPoint? = nil, cellImage: UIImage) {
        baseView = view
        remitter = RemitterView(frame: offsetFrame(offset: offset),cellImage: cellImage)
        
        remitter?.sendSubviewToBack(baseView)
        view.addSubview(remitter!)
    }
    
    /// create remitter view with default properties in this view
    init(in view: UIView, offsetType: RemitterOffset, cellImage: UIImage) {
        baseView = view
        var offset:CGPoint?
        switch offsetType {
        case .normal:
            offset = CGPoint(x: -120, y: -400)
        case .zero:
            offset = nil
        }
        remitter = RemitterView(frame: offsetFrame(offset: offset), cellImage: cellImage)
        remitter?.sendSubviewToBack(baseView)
        view.addSubview(remitter!)
    }
    
    /// create remitter view with parameters in this view
    init(in view: UIView, offset:CGPoint? = nil, layerPosition: CGPoint, layerShape: CAEmitterLayerEmitterShape, cellImage: UIImage, birthRate: Float, lifetime: Float, color: UIColor?, velocity: CGFloat, velocityRange: CGFloat, emissionRange: CGFloat, scale: CGFloat) {
        baseView = view
        var cellImage = cellImage
        cellImage = resizeImage(image: cellImage, targetSize: CGSize(width: 16, height: 16))
        
        remitter = RemitterView(
            frame: offsetFrame(offset: offset),
            layerPosition: layerPosition,
            layerShape: layerShape,
            cellImage: cellImage,
            birthRate: birthRate,
            lifetime: lifetime,
            color: color,
            velocity: velocity,
            velocityRange: velocityRange,
            emissionRange: emissionRange,
            scale: scale
        )
        remitter?.sendSubviewToBack(baseView)
        view.addSubview(remitter!)
    }
    
    init(in view: UIView, offsetType:RemitterOffset, layerPosition: CGPoint, layerShape: CAEmitterLayerEmitterShape, cellImage: UIImage, birthRate: Float, lifetime: Float, color: UIColor?, velocity: CGFloat, velocityRange: CGFloat, emissionRange: CGFloat, scale: CGFloat) {
        baseView = view
        
        var offset: CGPoint?
        switch offsetType {
        case .normal:
            offset = CGPoint(x: -120, y: -400)
        case .zero:
            offset = nil
        }
        
        var cellImage = cellImage
        cellImage = resizeImage(image: cellImage, targetSize: CGSize(width: 16, height: 16))
        
        remitter = RemitterView(
            frame: offsetFrame(offset: offset),
            layerPosition: layerPosition,
            layerShape: layerShape,
            cellImage: cellImage,
            birthRate: birthRate,
            lifetime: lifetime,
            color: color,
            velocity: velocity,
            velocityRange: velocityRange,
            emissionRange: emissionRange,
            scale: scale
        )
        remitter?.sendSubviewToBack(baseView)
        view.addSubview(remitter!)
    }
    
    /// this function adds remitter to view if you removed
    func resume(animated: Bool) {
        remitterControl()
        baseView.addSubview(remitter!)
        baseView.sendSubviewToBack(remitter!)
        remitter?.alpha = 0
        
        if animated {
            UIView.animate(withDuration: 0.7, animations:  {
                self.remitter?.alpha = 1
            },completion: nil)
        
        } else {
            self.remitter?.alpha = 1
        }
    }
    
    /// this function removed remitter from your view
    func stop(animated: Bool) {
        remitterControl()
        
        if animated {
            UIView.animate(withDuration: 0.7, animations:  {
                self.remitter!.transform = CGAffineTransform(translationX: 0, y: 10)
                self.remitter?.alpha = 0
            },completion: { _ in
                self.remitter!.removeFromSuperview()
            })
        } else {
            remitter!.removeFromSuperview()
        }
    }
    
    func stopAfter(seconds: Double, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: {
            self.stop(animated: animated)
        })
    }
    
     func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    //---------------------------- Private ----------------------------//
    
    private func remitterControl() {
        // Somethings work on insert and remove
    }
    
    private func offsetFrame(offset: CGPoint?) -> CGRect {
        if let offset = offset {
            return CGRect(x: offset.x, y: offset.y, width: baseView.bounds.width, height: baseView.bounds.height)
        } else {
            return CGRect(x: 0, y: 0, width: baseView.bounds.width, height: baseView.bounds.height)
        }
        
    }
    
}
