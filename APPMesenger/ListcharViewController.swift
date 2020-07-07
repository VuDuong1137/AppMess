//
//  CharViewController.swift
//  APPMesenger
//
//  Created by Dương chãng on 7/4/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

var ref: DatabaseReference!
   var currentUser:Userss!

class ListcharViewController: UIViewController {
    
    
   

    
    let View1 : UIView = {
        let View = UIView()
        View.translatesAutoresizingMaskIntoConstraints = false
        return View
    }()
    let imge : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "email")
        return image
    }()
    
    let TableViewchat : UITableView = {
        let Tbv = UITableView()
        Tbv.translatesAutoresizingMaskIntoConstraints = false
        return Tbv
    }()
    
    let ViewBotton : UIView = {
        let View = UIView()
        View.translatesAutoresizingMaskIntoConstraints = false
        View.backgroundColor = .red
        return View
    }()
    
    
    
    let btnchar : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "IamRick"), for: UIControl.State.normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return btn
    }()
    let btnList : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "list"), for: UIControl.State.normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "email")
        imageView.image = image
        navigationItem.titleView = imageView
        view.backgroundColor = .white
        setuplayout()
        btnList.addTarget(self, action: #selector(tapGotoMainListchar), for: .touchUpInside)
        
     btnchar.addTarget(self, action: #selector(tapGotoMainchar), for: .touchUpInside)
        
        ref = Database.database().reference()
        // lấy thông tin người ùng từ filebase về. ở Doc firebase Get a user's profile
        // nếu có tôn tại một user đang kết nối giua ứng dụng và firebase cảu chúng ta
       
        if let user = Auth.auth().currentUser {
            // thì lấy về tên hiển thị emal đuòng linh tấm hinh
          let uid = user.uid
          let email = user.email
          let photoURL = user.photoURL
            let name = user.displayName
           
            currentUser = Userss(Id: uid, Email: email!, fullname: name!, LinkAvatar: String(photoURL))
    
            
        } else{
            print("không có user")
        }
        
        
        
    }
    @objc func tapGotoMainchar(){
         let vc = CharViewController()
         vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true, completion: nil)
     }
    @objc func tapGotoMainListchar(){
        let vc = ListcharViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func setuplayout() {
        view.addSubview(View1)
        View1.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        View1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        View1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        View1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        View1.backgroundColor = .red
        View1.addSubview(imge)
        imge.bottomAnchor.constraint(equalTo: View1.bottomAnchor, constant: -10).isActive = true
        imge.centerXAnchor.constraint(equalTo: View1.centerXAnchor).isActive = true
        imge.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imge.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(TableViewchat)
        TableViewchat.topAnchor.constraint(equalTo: View1.bottomAnchor, constant: 0).isActive = true
        TableViewchat.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        TableViewchat.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        TableViewchat.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        
        view.addSubview(ViewBotton)
        ViewBotton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        ViewBotton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        ViewBotton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ViewBotton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        ViewBotton.addSubview(btnchar)
        ViewBotton.addSubview(btnList)
        btnchar.topAnchor.constraint(equalTo: ViewBotton.topAnchor, constant: 30).isActive = true
        btnchar.trailingAnchor.constraint(equalTo: ViewBotton.centerXAnchor, constant: -75).isActive = true
        btnchar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnchar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btnList.topAnchor.constraint(equalTo: ViewBotton.topAnchor, constant: 30).isActive = true
        btnList.leadingAnchor.constraint(equalTo: ViewBotton.centerXAnchor, constant: 75).isActive = true
        btnList.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnList.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
