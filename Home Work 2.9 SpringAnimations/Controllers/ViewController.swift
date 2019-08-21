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
    
    @IBOutlet var animatedLabel: SpringLabel!
    @IBOutlet var runAnimationButton: UIButton!
    
    //MARK: - Properties

    private var animationPreset: Spring.AnimationPreset!
    private var animationCurve: Spring.AnimationCurve!
    private var animationProperty: AnimationProperty!
    
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
        AnimationProperty(name: "force", value: 1, minValue: 1, maxValue: 5),
        AnimationProperty(name: "duration", value: 1, minValue: 0.5, maxValue: 5),
        AnimationProperty(name: "delay", value: 0, minValue: 0, maxValue: 5),
        AnimationProperty(name: "scaleX", value: 0, minValue: 0, maxValue: 300),
        AnimationProperty(name: "scaleY", value: 0, minValue: 0, maxValue: 300),
        AnimationProperty(name: "rotate", value: 0, minValue: 0, maxValue: 5),
        AnimationProperty(name: "damping", value: 0.7, minValue: 0, maxValue: 1),
        AnimationProperty(name: "velocity", value: 0.7, minValue: 0, maxValue: 1),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureRunAnimationButton()
        setupAnimation()
    }
    
    //MARK: - Actions
    
    @IBAction func startAnimation() {
        generateTextForLabel()
        //resetSettings()
        setupAnimation()
    }

    //MARK: - Private funcs
    
    private func configureRunAnimationButton() {
        runAnimationButton.titleLabel?.lineBreakMode = .byWordWrapping
        runAnimationButton.titleLabel?.textAlignment = .center
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
        animationProperty.value = CGFloat.random(in:
            animationProperty.minValue...animationProperty.maxValue)
        
        switch animationProperty.name {
        case "force": animatedLabel.force = animationProperty.value
        case "duration": animatedLabel.duration = animationProperty.value
        case "delay": animatedLabel.delay = animationProperty.value
        case "scaleX": animatedLabel.scaleX = animationProperty.value
        case "force": animatedLabel.force = animationProperty.value
        case "force": animatedLabel.force = animationProperty.value
        case "force": animatedLabel.force = animationProperty.value
        case "force": animatedLabel.force = animationProperty.value
        }
        
    }
    
    private func resetSettings() {
        animatedLabel.force = 1
        animatedLabel.duration = 1
        animatedLabel.delay = 0
        
        animatedLabel.damping = 0.7
        animatedLabel.velocity = 0.7
        animatedLabel.scaleX = 0
        animatedLabel.scaleY = 0
        animatedLabel.rotate = 0
    }
    
    private func changeTextButton() {
        runAnimationButton.setTitle("Run \(animationPreset.rawValue) with \(animationCurve.rawValue)", for: .normal)
    }
    
    private func generateTextForLabel() -> String {
        
        var text = ""
        
        if animatedLabel.animation != "" {
            text += "animation = \"\(animatedLabel.animation)\"\n"
        }
        if animatedLabel.curve != "" {
            text += "curve = \"\(animatedLabel.curve)\"\n"
        }
        if animatedLabel.force != 1 {
            text += String(format: "force =  %.1f\n", Double(animatedLabel.force))
        }
        if animatedLabel.duration != 0.7 {
            text += String(format: "duration =  %.1f\n", Double(animatedLabel.duration))
        }
        if animatedLabel.delay != 0 {
            text += String(format: "delay =  %.1f\n", Double(animatedLabel.delay))
        }
        if animatedLabel.scaleX != 1 {
            text += String(format: "scaleX =  %.1f\n", Double(animatedLabel.scaleX))
        }
        if animatedLabel.scaleY != 1 {
            text += String(format: "scaleY =  %.1f\n", Double(animatedLabel.scaleY))
        }
        if animatedLabel.rotate != 0 {
            text += String(format: "rotate =  %.1f\n", Double(animatedLabel.rotate))
        }
        if animatedLabel.damping != 0.7 {
            text += String(format: "damping =  %.1f\n", Double(animatedLabel.damping))
        }
        if animatedLabel.velocity != 0.7 {
            text += String(format: "velocity =  %.1f\n", Double(animatedLabel.velocity))
        }
        
        return text
    }
    
}
