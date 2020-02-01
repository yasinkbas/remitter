//
//  RemitterView.swift
//  Pods-remitter_Example
//
//  Created by Yasin Akbaş on 22.10.2019.
//

import UIKit

final class RemitterView: UIView {
    
    /// main function for remitter view
    func makeRemitter(layerPosition: CGPoint, layerShape: CAEmitterLayerEmitterShape, cellImage: UIImage, birthRate: Float, lifetime: Float, color: UIColor? = nil, velocity: CGFloat, velocityRange: CGFloat, emissionRange: CGFloat, scale: CGFloat = 0.33) {
        let remitterLayer = layer as! CAEmitterLayer
        remitterLayer.emitterPosition = layerPosition
        remitterLayer.emitterSize = bounds.size
        remitterLayer.emitterShape = layerShape
        
        var image = cellImage.withRenderingMode(.alwaysTemplate)
        if #available(iOS 13.0, *) {
            image = image.withTintColor(color == nil ? UIColor.white : color!)
        }
        
        let remitterCell = CAEmitterCell()
        remitterCell.contents = image.cgImage
        remitterCell.birthRate = birthRate
        remitterCell.lifetime = lifetime
        remitterCell.color = color != nil ? color?.cgColor : UIColor.white.cgColor
        remitterCell.velocity = velocity
        remitterCell.velocityRange = velocityRange
        remitterCell.emissionRange = emissionRange
        remitterCell.emissionLongitude = -CGFloat.pi
        remitterCell.yAcceleration = 70
        remitterCell.xAcceleration = 0
        remitterCell.scale = scale
        remitterCell.scaleRange = 1.25
        remitterCell.scaleSpeed = -0.25
        remitterCell.alphaRange = 0.5
        remitterCell.alphaSpeed = -0.15

        remitterLayer.emitterCells = [remitterCell]
    }
    
    /// init without custom parameters
    init(frame: CGRect, cellImage: UIImage) {
        super.init(frame: frame)
        
        makeRemitter(
            layerPosition: CGPoint(x: bounds.size.width, y: 0),
            layerShape: .rectangle,
            cellImage: cellImage,
            birthRate: 200,
            lifetime: 4,
            velocity: 10,
            velocityRange: 350,
            emissionRange: CGFloat.pi / 2
        )
    }
    
    /// init with custom parameters
    init(frame:CGRect, layerPosition: CGPoint, layerShape: CAEmitterLayerEmitterShape, cellImage: UIImage, birthRate: Float, lifetime: Float, color: UIColor? = nil, velocity: CGFloat, velocityRange: CGFloat, emissionRange: CGFloat, scale: CGFloat = 0.33) {
        super.init(frame: frame)
        
        makeRemitter(
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
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override class var layerClass: AnyClass {
      return CAEmitterLayer.self
    }
    
}

