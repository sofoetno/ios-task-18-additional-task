import UIKit

class ViewController: UIViewController {
    private let gradients: [UIColor] = [.blue, .red, .green, .gray]
    private let tbcAcademyLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTbcAcademyLabel()
        animateBackground(index: 0)
        setUpConstrains()
        animationText()
    }
    
    func setUpTbcAcademyLabel() {
        tbcAcademyLabel.textColor = .black
        tbcAcademyLabel.textAlignment = .center
        tbcAcademyLabel.text = "TBC IT Academy"
        tbcAcademyLabel.font = .systemFont(ofSize: 24)
        view.addSubview(tbcAcademyLabel)
    }

    func animateBackground(index: Int) {
        UIView.animate(withDuration: 4, animations: {
            self.view.backgroundColor = self.gradients[index]
        }) { [weak self] _ in
            if let count = self?.gradients.count {
                let newIndex = index < count - 1 ? index + 1 : 0
                
                self?.animateBackground(index: newIndex)
            }
        }
    }
    
    func setUpConstrains() {
        tbcAcademyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tbcAcademyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tbcAcademyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func animationText() {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0.1
        scaleAnimation.toValue = 1.0

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = CGFloat.pi
        rotationAnimation.autoreverses = true
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.duration = 4

        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.0
        opacityAnimation.toValue = 1.0
        opacityAnimation.repeatCount = 1

        let fontSizeAnimation = CABasicAnimation(keyPath: "font")
        fontSizeAnimation.fromValue = 10.0
        fontSizeAnimation.toValue = UIFont.systemFont(ofSize: 20.0)
        fontSizeAnimation.repeatCount = 1

        let group = CAAnimationGroup()
        group.animations = [scaleAnimation, opacityAnimation, fontSizeAnimation]
        group.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        group.duration = 4.0
        
        tbcAcademyLabel.layer.add(group, forKey: "labelAnimation")
        tbcAcademyLabel.layer.add(rotationAnimation, forKey: "labelrotate")
    }
}
