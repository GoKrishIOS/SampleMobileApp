//
//  ViewController.swift
//  SimpleMobileApp
//
//  Created by Gokul on 12/30/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var curverView: UIView!
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIView!
    @IBOutlet weak var googleBtn: UIView!
    @IBOutlet weak var twitterBtn: UIView!
    @IBOutlet weak var donhaveBtn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fulltext = "Don't have an account SignUp"
        let underlineAttriString = NSMutableAttributedString(string: fulltext)
        let range1 = (fulltext as NSString).range(of: "SignUp")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15), range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: range1)
        donhaveBtn.attributedText = underlineAttriString
        donhaveBtn.isUserInteractionEnabled = true
        donhaveBtn.lineBreakMode = .byWordWrapping
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedOnLabel(_:)))
        tapGesture.numberOfTouchesRequired = 1
        donhaveBtn.addGestureRecognizer(tapGesture)
        
        
        signUpBtn.mk_addTapHandler { (action) in
            let contrller = AppStoryboard.Main.viewController(viewControllerClass: HomeViewController.self)
            self.navigationController?.pushViewController(contrller, animated: true)
        }
        
        loginBtn.mk_addTapHandler { (action) in
            let contrller = AppStoryboard.Main.viewController(viewControllerClass: HomeViewController.self)
            self.navigationController?.pushViewController(contrller, animated: true)
        }        
    }
    
    
    override func viewDidLayoutSubviews() {
        curverView.addBottomRoundedEdge(desiredCurve: 0.6)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _ = [emailTextBox,passwordTextBox].map {
            $0?.addlineBottom()
        }
        emailTextBox.attributedPlaceholder = NSAttributedString(string: "Enter Email-ID",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8)])
        passwordTextBox.attributedPlaceholder = NSAttributedString(string: "Enter Password",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.8)])
        _ = [signUpBtn, loginBtn].map { $0.layer.applyCornerRadiusShadow(color: UIColor.lightGray,
                                                                         alpha: 0.38,
                                                                         x: 0, y: 3,
                                                                         blur: 10,
                                                                         spread: 0,
                                                                         cornerRadiusValue: 15) }
        _ = [facebookBtn, googleBtn, twitterBtn].map{ $0.layer.applyCornerRadiusShadow(color: UIColor.lightGray,
                                                                                       alpha: 0.38,
                                                                                       x: 0, y: 3,
                                                                                       blur: 10,
                                                                                       spread: 0,
                                                                                       cornerRadiusValue: 8)  }
    }
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = donhaveBtn.text else { return }
        let emailRange = (text as NSString).range(of: "SignUp")
        if gesture.didTapAttributedTextInLabel(label: self.donhaveBtn, inRange: emailRange) {
            let contrller = AppStoryboard.Main.viewController(viewControllerClass: HomeViewController.self)
            self.navigationController?.pushViewController(contrller, animated: true)
        }
    }
}
