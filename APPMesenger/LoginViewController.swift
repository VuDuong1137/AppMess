//
//  LoginViewController.swift
//  APPMesenger
//
//  Created by Dương chãng on 7/3/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    
    let ViewFa : UIView = {
        let View = UIView()
        View.translatesAutoresizingMaskIntoConstraints = false
        //View.backgroundColor = .green
        return View
    }()
    let iamgeview: UIImageView = {
        let imge = UIImageView()
        imge.image = UIImage(named: "email")
        imge.translatesAutoresizingMaskIntoConstraints = false
        return imge
    }()
    let textFieldemail :  UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "✉️ Your Gmail"
        text.tintColor = .red
        text.textAlignment = .center
        text.alpha = 0.4
        
        text.layer.cornerRadius = 20
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.borderWidth = 2
        return text
    }()
    let textField1Password :  UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "🔒 Your PassWord"
        text.textAlignment = .center
        text.alpha = 0.4
        
        text.layer.cornerRadius = 20
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.borderWidth = 2
        return text
    }()
    let btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = #colorLiteral(red: 0.9433594346, green: 0.5431588078, blue: 0.7514827729, alpha: 1)
        btn.layer.shadowColor = UIColor.white.cgColor
        //btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 0, height: 7)
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    let btn2: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Register", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = #colorLiteral(red: 0.9433594346, green: 0.5431588078, blue: 0.7514827729, alpha: 1)
        btn.layer.shadowColor = UIColor.white.cgColor
        //btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 0, height: 7)
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgae = UIImageView(frame: UIScreen.main.bounds)
        imgae.image = UIImage(named: "eb3ff64fca7696986064920162d0ce5e")
        view.insertSubview(imgae, at: 0)
        setuplayout()
        btn.addTarget(self, action: #selector(Tap), for: .touchUpInside)
        
        
        
        
    }
    func setuplayout() {
        view.addSubview(ViewFa)
        ViewFa.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        ViewFa.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ViewFa.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        ViewFa.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        ViewFa.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        ViewFa.addSubview(iamgeview)
        iamgeview.topAnchor.constraint(equalTo: ViewFa.topAnchor, constant: 30).isActive = true
        iamgeview.centerXAnchor.constraint(equalTo: ViewFa.centerXAnchor).isActive = true
        iamgeview.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iamgeview.widthAnchor.constraint(equalToConstant: 60).isActive = true
        ViewFa.addSubview(textFieldemail)
        ViewFa.addSubview(textField1Password)
        textFieldemail.topAnchor.constraint(equalTo: iamgeview.bottomAnchor, constant: 35).isActive  = true
        textFieldemail.centerXAnchor.constraint(equalTo: ViewFa.centerXAnchor).isActive = true
        textFieldemail.leadingAnchor.constraint(equalTo: ViewFa.leadingAnchor, constant: 10).isActive = true
        textFieldemail.trailingAnchor.constraint(equalTo: ViewFa.trailingAnchor, constant: -10).isActive = true
        textFieldemail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField1Password.heightAnchor.constraint(equalToConstant: 50).isActive  = true
        textField1Password.topAnchor.constraint(equalTo: textFieldemail.bottomAnchor, constant: 25).isActive  = true
        textField1Password.centerXAnchor.constraint(equalTo: ViewFa.centerXAnchor).isActive = true
        textField1Password.leadingAnchor.constraint(equalTo: ViewFa.leadingAnchor, constant: 10).isActive = true
        textField1Password.trailingAnchor.constraint(equalTo: ViewFa.trailingAnchor, constant: -10).isActive = true
        ViewFa.addSubview(btn)
        ViewFa.addSubview(btn2)
        btn.topAnchor.constraint(equalTo: textField1Password.bottomAnchor, constant: 30).isActive = true
        btn.trailingAnchor.constraint(equalTo: ViewFa.centerXAnchor, constant: -40).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn2.topAnchor.constraint(equalTo: textField1Password.bottomAnchor, constant: 30).isActive = true
        btn2.leadingAnchor.constraint(equalTo: ViewFa.centerXAnchor, constant: 40).isActive = true
        btn2.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btn2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        
    }
    
    @objc func Tap(){
        
        
        let ativity: UIActivityIndicatorView = UIActivityIndicatorView()
        ativity.color = .red
        self.view.addSubview(ativity)
        // sét cho nó phủ hết view chính dể tay mình ko chạm được khí đợi nó load
        ativity.frame = self.view.frame
        ativity.center = self.view.center
        ativity.startAnimating()
        
        Auth.auth().signIn(withEmail: textFieldemail.text!, password: textField1Password.text!) { (ueser, eror) in
            
            
            
            if eror == nil{
                
                print("thành công")
                
                
                
            } else {
                DispatchQueue.global().async {
                    for index in 1...1000{
                        print(index)
                    }
                   
                        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
                             DispatchQueue.main.async {
                             ativity.stopAnimating()
                            let alrt = UIAlertController(title: "Thông Báo", message: "Email hoặc Password không chính xác", preferredStyle: .alert)
                            alrt.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                            self.present(alrt, animated: true, completion: nil)
                            
                        }
                        
                        
                    }
                    
                }
                
                
                
                
            }
        }
    }
    
}
