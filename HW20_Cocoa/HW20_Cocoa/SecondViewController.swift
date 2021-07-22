//
//  SecondViewController.swift
//  HW20_Cocoa
//
//  Created by Nata on 21.07.2021.
//

import Spring

class SecondViewController: UIViewController {

    @IBOutlet weak var springView: SpringView!

    @IBOutlet weak var springViewLbl: SpringLabel!

    @IBOutlet weak var springLbl: SpringLabel!

    @IBOutlet weak var springBtnGo: SpringButton!

    @IBOutlet weak var springBtnFinish: SpringButton!

    var name = ""
    var text = ""
    var closure: ((String) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        springLbl.text = name
        setUpSpringView()
        setUpSpringBtnGo()
        setUpSpringBtnFinish()
    }

    @IBAction func springAnimationBtnAction() {
        // тип анимации
        springView.animation = AnimationType.wobble.rawValue
        // анимационная кривая
        springView.curve = Curve.easeInOut.rawValue
        // сила
        springView.force = 2
        // продолжительность
        springView.duration = 1
        // задержка
        springView.delay = 0.5
        // старт анимции
        springView.animate()
        // тип анимации
        springBtnGo.animation = AnimationType.flipY.rawValue
        // анимационная кривая
        springBtnGo.curve = Curve.easeOut.rawValue
        // старт анимции
        springBtnGo.animate()

        springLbl.text = String(springView.animation)
        springViewLbl.text = String(springView.curve)
        springBtnFinish.isEnabled = true
        springBtnFinish.backgroundColor = .systemOrange
    }

    @IBAction func changeDataInFirstVC() {
        closure?("Game over!")
    }

    private func setUpSpringBtnGo() {
        springBtnGo.layer.cornerRadius = self.springBtnGo.bounds.height / 2
    }

    private func setUpSpringView() {
        springView.layer.cornerRadius = self.springView.bounds.height / 4
    }

    private func setUpSpringBtnFinish() {
        springBtnFinish.layer.cornerRadius = self.springBtnFinish.bounds.height / 4
        springBtnFinish.isEnabled = false
        springBtnFinish.backgroundColor = .gray
    }
}
