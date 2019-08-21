//
//  ViewController.swift
//  Home Work 2.9 SpringAnimations
//
//  Created by Maksim Grebenozhko on 20/08/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Spring

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet var runAnimationButton: UIButton!
    @IBOutlet var animatedButton: SpringButton!
    
    //MARK: - Properties

    private var animationPreset: Spring.AnimationPreset!
    private var animationCurve: Spring.AnimationCurve!
    private var animationProperty: AnimationProperty!
    private var propertyValue: CGFloat!
    
    private let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]
    
    private var animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]
    
    private var animationProperties: [AnimationProperty] = [
        AnimationProperty(name: "force", minValue: 1, maxValue: 5),
        AnimationProperty(name: "duration", minValue: 0.5, maxValue: 5),
        AnimationProperty(name: "delay", minValue: 0, maxValue: 5),
        AnimationProperty(name: "scaleX", minValue: 0, maxValue: 300),
        AnimationProperty(name: "scaleY", minValue: 0, maxValue: 300),
        AnimationProperty(name: "rotate", minValue: 0, maxValue: 5),
        AnimationProperty(name: "damping", minValue: 0, maxValue: 1),
        AnimationProperty(name: "velocity", minValue: 0, maxValue: 1),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureButtons()
        setupAnimation()
    }
    
    //MARK: - Actions
    
    @IBAction func startAnimation() {
        resetSettings()
        applyAnimations()
        animatedButton.animate()
        setupAnimation()
    }
    
    //MARK: - Private funcs
    
    private func configureButtons() {
        runAnimationButton.titleLabel?.lineBreakMode = .byWordWrapping
        runAnimationButton.titleLabel?.textAlignment = .center

        animatedButton.titleLabel?.lineBreakMode = .byWordWrapping
        animatedButton.titleLabel?.textAlignment = .center
    }

    private func setupAnimation() {
        selectAnimation()
        changeTextButton()
    }
    
    private func selectAnimation() {
        
        var randomItem = Int.random(in: 0..<animations.count)
        animationPreset = animations[randomItem]

        randomItem = Int.random(in: 0..<animationCurves.count)
        animationCurve = animationCurves[randomItem]

        randomItem = Int.random(in: 0..<animationProperties.count)
        animationProperty = animationProperties[randomItem]
        propertyValue = CGFloat.random(in:
            animationProperty.minValue...animationProperty.maxValue)
    }
    
    private func applyAnimations() {
        
        switch animationProperty.name {
        case "force": animatedButton.force = propertyValue
        case "duration": animatedButton.duration = propertyValue
        case "delay": animatedButton.delay = propertyValue
        case "scaleX": animatedButton.scaleX = propertyValue
        case "scaleY": animatedButton.scaleY = propertyValue
        case "rotate": animatedButton.rotate = propertyValue
        case "damping": animatedButton.damping = propertyValue
        case "velocity": animatedButton.velocity = propertyValue
        default: return
        }
        
        animatedButton.animation = animationPreset.rawValue
        animatedButton.curve = animationCurve.rawValue
        animatedButton.setTitle(runAnimationButton.titleLabel?.text,
            for: .normal)
    }
    
    private func resetSettings() {
        
        let patternLabel = SpringLabel()
        animatedButton.force = patternLabel.force
        animatedButton.duration = patternLabel.duration
        animatedButton.delay = patternLabel.delay
        animatedButton.damping = patternLabel.damping
        animatedButton.velocity = patternLabel.velocity
        animatedButton.scaleX = patternLabel.scaleX
        animatedButton.scaleY = patternLabel.scaleY
        animatedButton.rotate = patternLabel.rotate
    }
    
    private func changeTextButton() {
        let newText = generateText()
        runAnimationButton.setTitle(newText, for: .normal)
    }
    
    private func generateText() -> String {
        
        var text = "Run\nanimation = \"\(animationPreset.rawValue)\"\n"
        text += "curve = \"\(animationCurve.rawValue)\"\n"
        text += String(format: "\(animationProperty.name) =  %.1f", Double(propertyValue))
        
        return text
    }
    
}
