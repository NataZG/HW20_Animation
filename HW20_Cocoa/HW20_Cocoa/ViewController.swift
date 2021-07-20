//
//  ViewController.swift
//  HW20_Cocoa
//
//  Created by Nata on 20.07.2021.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var springView: SpringView!
    
    @IBOutlet weak var springBtn: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func springAnimationBtnAction() {
        // тип анимации
        springView.animation = AnimationType.squeeze.rawValue
        // анимационная кривая
        springView.curve = Curve.linear.rawValue
        // сила
        springView.force = 2
        // продолжительность
        springView.duration = 1
        // задержка
        springView.delay = 0.3
        
        // старт анимции
        springView.animate()

        // тип анимации
        springBtn.animation = AnimationType.morph.rawValue
        // анимационная кривая
        springBtn.curve = Curve.easeOut.rawValue
        // старт анимции
        springBtn.animate()
    }

}

enum AnimationType: String {
    case shake
    case pop
    case morph
    case squeeze
    case wobble
    case swing
    case flipX
    case flipY
    case fall
    case squeezeLeft
    case squeezeRight
    case squeezeDown
    case squeezeUp
    case slideLeft
    case slideRight
    case slideDown
    case slideUp
    case fadeIn
    case fadeOut
    case fadeInLeft
    case fadeInRight
    case fadeInDown
    case fadeInUp
    case zoomIn
    case zoomOut
    case flash
}

enum Curve: String {
    case spring
    case linear
    case easeIn
    case easeOut
    case easeInOut
}
