//
//  activitySpinnerView.swift
//
//  Code generated using QuartzCode 1.39.2 on 2/12/16.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class ActivitySpinnerView: UIView {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
    var animationAdded = false
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let allOval = CALayer()
		self.layer.addSublayer(allOval)
		layers["allOval"] = allOval
		let oval = CAShapeLayer()
		allOval.addSublayer(oval)
		layers["oval"] = oval
		let oval2 = CAShapeLayer()
		allOval.addSublayer(oval2)
		layers["oval2"] = oval2
		let oval3 = CAShapeLayer()
		allOval.addSublayer(oval3)
		layers["oval3"] = oval3
		
		resetLayerPropertiesForLayerIdentifiers(nil)
		setupLayerFrames()
	}
	
	func resetLayerPropertiesForLayerIdentifiers(layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("oval"){
			let oval = layers["oval"] as! CAShapeLayer
			oval.lineCap     = kCALineCapRound
			oval.fillColor   = nil
			oval.strokeColor = UIColor(red:0.863, green: 0.714, blue:0.647, alpha:1).CGColor
			oval.lineWidth   = 1.67
		}
		if layerIds == nil || layerIds.contains("oval2"){
			let oval2 = layers["oval2"] as! CAShapeLayer
			oval2.lineCap     = kCALineCapRound
			oval2.fillColor   = nil
			oval2.strokeColor = UIColor(red:0.863, green: 0.714, blue:0.647, alpha:1).CGColor
			oval2.lineWidth   = 1.67
		}
		if layerIds == nil || layerIds.contains("oval3"){
			let oval3 = layers["oval3"] as! CAShapeLayer
			oval3.lineCap     = kCALineCapRound
			oval3.fillColor   = nil
			oval3.strokeColor = UIColor(red:0.863, green: 0.714, blue:0.647, alpha:1).CGColor
			oval3.lineWidth   = 1.67
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let allOval : CALayer = layers["allOval"] as? CALayer{
			allOval.frame = CGRectMake(0.06 * allOval.superlayer!.bounds.width, 0.0767 * allOval.superlayer!.bounds.height, 0.8833 * allOval.superlayer!.bounds.width, 0.8633 * allOval.superlayer!.bounds.height)
		}
		
		if let oval : CAShapeLayer = layers["oval"] as? CAShapeLayer{
			oval.frame = CGRectMake(0.06793 * oval.superlayer!.bounds.width, 0, 0.86041 * oval.superlayer!.bounds.width, 0.88034 * oval.superlayer!.bounds.height)
			oval.path  = ovalPathWithBounds((layers["oval"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let oval2 : CAShapeLayer = layers["oval2"] as? CAShapeLayer{
			oval2.frame = CGRectMake(0, 0.11966 * oval2.superlayer!.bounds.height, 0.86041 * oval2.superlayer!.bounds.width, 0.88034 * oval2.superlayer!.bounds.height)
			oval2.path  = oval2PathWithBounds((layers["oval2"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let oval3 : CAShapeLayer = layers["oval3"] as? CAShapeLayer{
			oval3.frame = CGRectMake(0.13959 * oval3.superlayer!.bounds.width, 0.11966 * oval3.superlayer!.bounds.height, 0.86041 * oval3.superlayer!.bounds.width, 0.88034 * oval3.superlayer!.bounds.height)
			oval3.path  = oval3PathWithBounds((layers["oval3"] as! CAShapeLayer).bounds).CGPath;
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addStartLoadingAnimation(){
		addStartLoadingAnimationCompletionBlock(nil)
	}
	
	func addStartLoadingAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 0.75
			completionAnim.delegate = self
			completionAnim.setValue("startLoading", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.addAnimation(completionAnim, forKey:"startLoading")
			if let anim = layer.animationForKey("startLoading"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		self.layer.speed = 1
		self.animationAdded = false
		
		let fillMode : String = kCAFillModeForwards
		
		let oval = layers["oval"] as! CAShapeLayer
		
		////Oval animation
		let ovalTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		ovalTransformAnim.values         = [0, 
			 120 * CGFloat(M_PI/180)]
		ovalTransformAnim.keyTimes       = [0, 1]
		ovalTransformAnim.duration       = 0.75
		ovalTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let ovalStrokeStartAnim      = CAKeyframeAnimation(keyPath:"strokeStart")
		ovalStrokeStartAnim.values   = [1, 0]
		ovalStrokeStartAnim.keyTimes = [0, 1]
		ovalStrokeStartAnim.duration = 0.75
		
		let ovalLineWidthAnim      = CAKeyframeAnimation(keyPath:"lineWidth")
		ovalLineWidthAnim.values   = [1.67, 1.67]
		ovalLineWidthAnim.keyTimes = [0, 1]
		ovalLineWidthAnim.duration = 0.75
		
		let ovalStrokeEndAnim      = CAKeyframeAnimation(keyPath:"strokeEnd")
		ovalStrokeEndAnim.values   = [1, 1]
		ovalStrokeEndAnim.keyTimes = [0, 1]
		ovalStrokeEndAnim.duration = 0.75
		
		let ovalStartLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([ovalTransformAnim, ovalStrokeStartAnim, ovalLineWidthAnim, ovalStrokeEndAnim], fillMode:fillMode)
		oval.addAnimation(ovalStartLoadingAnim, forKey:"ovalStartLoadingAnim")
		
		////Oval2 animation
		let oval2StrokeStartAnim      = CAKeyframeAnimation(keyPath:"strokeStart")
		oval2StrokeStartAnim.values   = [1, 0]
		oval2StrokeStartAnim.keyTimes = [0, 1]
		oval2StrokeStartAnim.duration = 0.75
		
		let oval2 = layers["oval2"] as! CAShapeLayer
		
		let oval2TransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		oval2TransformAnim.values         = [-120 * CGFloat(M_PI/180), 
			 0]
		oval2TransformAnim.keyTimes       = [0, 1]
		oval2TransformAnim.duration       = 0.75
		oval2TransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval2LineWidthAnim      = CAKeyframeAnimation(keyPath:"lineWidth")
		oval2LineWidthAnim.values   = [1.67, 1.67]
		oval2LineWidthAnim.keyTimes = [0, 1]
		oval2LineWidthAnim.duration = 0.75
		
		let oval2StartLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([oval2StrokeStartAnim, oval2TransformAnim, oval2LineWidthAnim], fillMode:fillMode)
		oval2.addAnimation(oval2StartLoadingAnim, forKey:"oval2StartLoadingAnim")
		
		////Oval3 animation
		let oval3StrokeStartAnim      = CAKeyframeAnimation(keyPath:"strokeStart")
		oval3StrokeStartAnim.values   = [1, 0]
		oval3StrokeStartAnim.keyTimes = [0, 1]
		oval3StrokeStartAnim.duration = 0.75
		
		let oval3 = layers["oval3"] as! CAShapeLayer
		
		let oval3TransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		oval3TransformAnim.values         = [-240 * CGFloat(M_PI/180), 
			 -120 * CGFloat(M_PI/180)]
		oval3TransformAnim.keyTimes       = [0, 1]
		oval3TransformAnim.duration       = 0.75
		oval3TransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval3LineWidthAnim      = CAKeyframeAnimation(keyPath:"lineWidth")
		oval3LineWidthAnim.values   = [1.67, 1.67]
		oval3LineWidthAnim.keyTimes = [0, 1]
		oval3LineWidthAnim.duration = 0.75
		
		let oval3StartLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([oval3StrokeStartAnim, oval3TransformAnim, oval3LineWidthAnim], fillMode:fillMode)
		oval3.addAnimation(oval3StartLoadingAnim, forKey:"oval3StartLoadingAnim")
	}
	
	func addLoadingAnimation(){
		self.layer.speed = 1
		self.animationAdded = false
		
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		let allOval = layers["allOval"] as! CALayer
		
		////AllOval animation
		let allOvalTransformAnim         = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		allOvalTransformAnim.values      = [0, 
			 360 * CGFloat(M_PI/180)]
		allOvalTransformAnim.keyTimes    = [0, 1]
		allOvalTransformAnim.duration    = 2
		allOvalTransformAnim.repeatCount = Float.infinity
		
		let allOvalLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([allOvalTransformAnim], fillMode:fillMode)
		allOval.addAnimation(allOvalLoadingAnim, forKey:"allOvalLoadingAnim")
	}
	
	func addEndLoadingAnimation(){
		addEndLoadingAnimationCompletionBlock(nil)
	}
	
	func addEndLoadingAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 0.25
			completionAnim.delegate = self
			completionAnim.setValue("endLoading", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.addAnimation(completionAnim, forKey:"endLoading")
			if let anim = layer.animationForKey("endLoading"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		self.layer.speed = 1
		self.animationAdded = false
		
		let fillMode : String = kCAFillModeForwards
		
		let oval = layers["oval"] as! CAShapeLayer
		
		////Oval animation
		let ovalTransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		ovalTransformAnim.values         = [0, 
			 120 * CGFloat(M_PI/180)]
		ovalTransformAnim.keyTimes       = [0, 1]
		ovalTransformAnim.duration       = 0.25
		ovalTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let ovalStrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
		ovalStrokeEndAnim.values         = [1, 0]
		ovalStrokeEndAnim.keyTimes       = [0, 1]
		ovalStrokeEndAnim.duration       = 0.25
		ovalStrokeEndAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let ovalLineWidthAnim            = CAKeyframeAnimation(keyPath:"lineWidth")
		ovalLineWidthAnim.values         = [1.67, 0]
		ovalLineWidthAnim.keyTimes       = [0, 1]
		ovalLineWidthAnim.duration       = 0.25
		ovalLineWidthAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let ovalEndLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([ovalTransformAnim, ovalStrokeEndAnim, ovalLineWidthAnim], fillMode:fillMode)
		oval.addAnimation(ovalEndLoadingAnim, forKey:"ovalEndLoadingAnim")
		
		let oval2 = layers["oval2"] as! CAShapeLayer
		
		////Oval2 animation
		let oval2TransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		oval2TransformAnim.values         = [-120 * CGFloat(M_PI/180), 
			 0]
		oval2TransformAnim.keyTimes       = [0, 1]
		oval2TransformAnim.duration       = 0.25
		oval2TransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval2StrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
		oval2StrokeEndAnim.values         = [1, 0]
		oval2StrokeEndAnim.keyTimes       = [0, 1]
		oval2StrokeEndAnim.duration       = 0.25
		oval2StrokeEndAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval2LineWidthAnim            = CAKeyframeAnimation(keyPath:"lineWidth")
		oval2LineWidthAnim.values         = [1.67, 0]
		oval2LineWidthAnim.keyTimes       = [0, 1]
		oval2LineWidthAnim.duration       = 0.25
		oval2LineWidthAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval2EndLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([oval2TransformAnim, oval2StrokeEndAnim, oval2LineWidthAnim], fillMode:fillMode)
		oval2.addAnimation(oval2EndLoadingAnim, forKey:"oval2EndLoadingAnim")
		
		let oval3 = layers["oval3"] as! CAShapeLayer
		
		////Oval3 animation
		let oval3TransformAnim            = CAKeyframeAnimation(keyPath:"transform.rotation.z")
		oval3TransformAnim.values         = [-240 * CGFloat(M_PI/180), 
			 -120 * CGFloat(M_PI/180)]
		oval3TransformAnim.keyTimes       = [0, 1]
		oval3TransformAnim.duration       = 0.25
		oval3TransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval3StrokeEndAnim            = CAKeyframeAnimation(keyPath:"strokeEnd")
		oval3StrokeEndAnim.values         = [1, 0]
		oval3StrokeEndAnim.keyTimes       = [0, 1]
		oval3StrokeEndAnim.duration       = 0.25
		oval3StrokeEndAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval3LineWidthAnim            = CAKeyframeAnimation(keyPath:"lineWidth")
		oval3LineWidthAnim.values         = [1.67, 0]
		oval3LineWidthAnim.keyTimes       = [0, 1]
		oval3LineWidthAnim.duration       = 0.25
		oval3LineWidthAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 0, 0.5, 1)
		
		let oval3EndLoadingAnim : CAAnimationGroup = QCMethod.groupAnimations([oval3TransformAnim, oval3StrokeEndAnim, oval3LineWidthAnim], fillMode:fillMode)
		oval3.addAnimation(oval3EndLoadingAnim, forKey:"oval3EndLoadingAnim")
	}
	
	//MARK: - Animation Cleanup
	
	override func animationDidStop(anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValueForKey(anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.valueForKey("needEndAnim") as! Bool{
				updateLayerValuesForAnimationId(anim.valueForKey("animId") as! String)
				removeAnimationsForAnimationId(anim.valueForKey("animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValuesForAnimationId(identifier: String){
		if identifier == "startLoading"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval"] as! CALayer).animationForKey("ovalStartLoadingAnim"), theLayer:(layers["oval"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval2"] as! CALayer).animationForKey("oval2StartLoadingAnim"), theLayer:(layers["oval2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval3"] as! CALayer).animationForKey("oval3StartLoadingAnim"), theLayer:(layers["oval3"] as! CALayer))
		}
		else if identifier == "Loading"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["allOval"] as! CALayer).animationForKey("allOvalLoadingAnim"), theLayer:(layers["allOval"] as! CALayer))
		}
		else if identifier == "endLoading"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval"] as! CALayer).animationForKey("ovalEndLoadingAnim"), theLayer:(layers["oval"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval2"] as! CALayer).animationForKey("oval2EndLoadingAnim"), theLayer:(layers["oval2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval3"] as! CALayer).animationForKey("oval3EndLoadingAnim"), theLayer:(layers["oval3"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(identifier: String){
		if identifier == "startLoading"{
			(layers["oval"] as! CALayer).removeAnimationForKey("ovalStartLoadingAnim")
			(layers["oval2"] as! CALayer).removeAnimationForKey("oval2StartLoadingAnim")
			(layers["oval3"] as! CALayer).removeAnimationForKey("oval3StartLoadingAnim")
		}
		else if identifier == "Loading"{
			(layers["allOval"] as! CALayer).removeAnimationForKey("allOvalLoadingAnim")
		}
		else if identifier == "endLoading"{
			(layers["oval"] as! CALayer).removeAnimationForKey("ovalEndLoadingAnim")
			(layers["oval2"] as! CALayer).removeAnimationForKey("oval2EndLoadingAnim")
			(layers["oval3"] as! CALayer).removeAnimationForKey("oval3EndLoadingAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func ovalPathWithBounds(bound: CGRect) -> UIBezierPath{
		let ovalPath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		ovalPath.moveToPoint(CGPointMake(minX + 0.5 * w, minY))
		ovalPath.addCurveToPoint(CGPointMake(minX, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.22386 * w, minY), controlPoint2:CGPointMake(minX, minY + 0.22386 * h))
		ovalPath.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY + h), controlPoint1:CGPointMake(minX, minY + 0.77614 * h), controlPoint2:CGPointMake(minX + 0.22386 * w, minY + h))
		ovalPath.addCurveToPoint(CGPointMake(minX + w, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.77614 * w, minY + h), controlPoint2:CGPointMake(minX + w, minY + 0.77614 * h))
		ovalPath.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY), controlPoint1:CGPointMake(minX + w, minY + 0.22386 * h), controlPoint2:CGPointMake(minX + 0.77614 * w, minY))
		
		return ovalPath;
	}
	
	func oval2PathWithBounds(bound: CGRect) -> UIBezierPath{
		let oval2Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		oval2Path.moveToPoint(CGPointMake(minX + 0.5 * w, minY))
		oval2Path.addCurveToPoint(CGPointMake(minX, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.22386 * w, minY), controlPoint2:CGPointMake(minX, minY + 0.22386 * h))
		oval2Path.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY + h), controlPoint1:CGPointMake(minX, minY + 0.77614 * h), controlPoint2:CGPointMake(minX + 0.22386 * w, minY + h))
		oval2Path.addCurveToPoint(CGPointMake(minX + w, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.77614 * w, minY + h), controlPoint2:CGPointMake(minX + w, minY + 0.77614 * h))
		oval2Path.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY), controlPoint1:CGPointMake(minX + w, minY + 0.22386 * h), controlPoint2:CGPointMake(minX + 0.77614 * w, minY))
		
		return oval2Path;
	}
	
	func oval3PathWithBounds(bound: CGRect) -> UIBezierPath{
		let oval3Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		oval3Path.moveToPoint(CGPointMake(minX + 0.5 * w, minY))
		oval3Path.addCurveToPoint(CGPointMake(minX, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.22386 * w, minY), controlPoint2:CGPointMake(minX, minY + 0.22386 * h))
		oval3Path.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY + h), controlPoint1:CGPointMake(minX, minY + 0.77614 * h), controlPoint2:CGPointMake(minX + 0.22386 * w, minY + h))
		oval3Path.addCurveToPoint(CGPointMake(minX + w, minY + 0.5 * h), controlPoint1:CGPointMake(minX + 0.77614 * w, minY + h), controlPoint2:CGPointMake(minX + w, minY + 0.77614 * h))
		oval3Path.addCurveToPoint(CGPointMake(minX + 0.5 * w, minY), controlPoint1:CGPointMake(minX + w, minY + 0.22386 * h), controlPoint2:CGPointMake(minX + 0.77614 * w, minY))
		
		return oval3Path;
	}
	
	
}
