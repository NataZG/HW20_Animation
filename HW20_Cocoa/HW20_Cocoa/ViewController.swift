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

    @IBOutlet weak var springLabel: SpringLabel!

    @IBOutlet weak var springViewLabel: SpringLabel!

    @IBOutlet weak var springBtnNext: SpringButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSpringBtn()
        setUpSpringView()
        setUpSpringBtnNext()
        // Do any additional setup after loading the view.
    }

    @IBAction func springAnimationBtnAction() {
        // тип анимации
        springView.animation = AnimationType.squeeze.rawValue
        // анимационная кривая
        springView.curve = Curve.easeIn.rawValue
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
        springBtn.curve = Curve.spring.rawValue
        // старт анимции
        springBtn.animate()

        springLabel.text = String(springView.animation)
        springLabel.animation = AnimationType.swing.rawValue
        springViewLabel.text = String(springView.curve)
        springBtnNext.isEnabled = true
        springBtnNext.backgroundColor = .systemPurple
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToSecondVC" else { return }
        guard let destination = segue.destination as? SecondViewController else { return }
        destination.name = "Let`s see!"

        guard let destination = segue.destination as? SecondViewController else { return }
        destination.closure = { [weak self] text in
            self?.springLabel.text = text
        }
    }

    private func setUpSpringBtn() {
        springBtn.layer.cornerRadius = self.springBtn.bounds.height / 2
    }

    private func setUpSpringView() {
        springView.layer.cornerRadius = self.springView.bounds.height / 4
    }

    private func setUpSpringBtnNext() {
        springBtnNext.layer.cornerRadius = self.springBtn.bounds.height / 2
        springBtnNext.isEnabled = false
        springBtnNext.backgroundColor = .gray
    }
}
