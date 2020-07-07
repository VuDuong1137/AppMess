//
//  MainRegisterViewController.swift
//  APPMesenger
//
//  Created by Dương chãng on 6/6/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit
import Firebase

let storage = Storage.storage()
let storageRef = storage.reference(forURL: "gs://appmes-aa1ab.appspot.com")

class MainRegisterViewController: UIViewController {
    
    
    let Viewbig : UIView = {
        let View = UIView()
        View.translatesAutoresizingMaskIntoConstraints = false
        //View.backgroundColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        return View
    }()
    let imge1 : UIImageView = {
        let imge = UIImageView()
        imge.image = UIImage(named: "email")
        imge.translatesAutoresizingMaskIntoConstraints = false
        return imge
    }()
    
    let textField :  UITextField = {
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
    let textField1 :  UITextField = {
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
    let textField2 :  UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Biệt Danh"
        text.textAlignment = .center
        text.alpha = 0.4
        
        text.layer.cornerRadius = 20
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.borderWidth = 2
        return text
    }()
    let textField3 :  UITextField = {
        let text = UITextField()
        text.backgroundColor = .white
        text.textColor = .black
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Full Your Name"
        text.textAlignment = .center
        text.alpha = 0.4
        
        text.layer.cornerRadius = 20
        text.layer.borderColor = UIColor.orange.cgColor
        text.layer.borderWidth = 2
        return text
    }()
    let imge2: UIImageView = {
        let imge = UIImageView()
        imge.image = UIImage(systemName: "person.circle")
        //imge.backgroundColor = .red
        imge.layer.cornerRadius = 90
        imge.layer.borderColor = UIColor.white.cgColor
        imge.layer.borderWidth = 3
        imge.clipsToBounds = true
        imge.translatesAutoresizingMaskIntoConstraints = false
        return imge
    }()
    let btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Ressister", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = #colorLiteral(red: 0.01545517519, green: 0.6010738015, blue: 0.9934815764, alpha: 1)
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
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        btn.backgroundColor = #colorLiteral(red: 0.01545517519, green: 0.6010738015, blue: 0.9934815764, alpha: 1)
        btn.layer.shadowColor = UIColor.white.cgColor
        //btn.layer.shadowRadius = 10
        btn.layer.shadowOpacity = 0.5
        btn.layer.shadowOffset = CGSize(width: 0, height: 7)
        btn.layer.cornerRadius = 15
        
        return btn
    }()
    
    
    
    var imgDAta: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageview = UIImageView(frame: UIScreen.main.bounds)
        imageview.image = UIImage(named: "129602_original_2000x2521")
        view.insertSubview(imageview, at: 0)
        
        setuplayout()
        imge2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handTap)))
        
        // cho phép tác động với ảnh còn những cái khác ko cần
        imge2.isUserInteractionEnabled = true
        
        // ấn nút đăng ký tài khoản trên filebase
        btn.addTarget(self, action: #selector(Tap), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(TapLogin), for: .touchUpInside)
        // nếu ngưới nhập ko chọn tấm hình
        // khi app vừa chạy lên
        // thì cho nó mặc định là cái hình
        imgDAta = UIImage.pngData(UIImage(named: "129602_original_2000x2521")!)()
    }
    func setuplayout() {
        view.addSubview(Viewbig)
        Viewbig.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        Viewbig.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        Viewbig.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34).isActive = true
        Viewbig.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        Viewbig.addSubview(imge1)
        
        imge1.topAnchor.constraint(equalTo: Viewbig.topAnchor, constant: 0).isActive = true
        imge1.centerXAnchor.constraint(equalTo: Viewbig.centerXAnchor).isActive = true
        imge1.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imge1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        Viewbig.addSubview(textField)
        textField.topAnchor.constraint(equalTo: imge1.bottomAnchor, constant: 30).isActive = true
        textField.leadingAnchor.constraint(equalTo: Viewbig.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: Viewbig.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        Viewbig.addSubview(textField1)
        textField1.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30).isActive = true
        textField1.leadingAnchor.constraint(equalTo: Viewbig.leadingAnchor, constant: 20).isActive = true
        textField1.trailingAnchor.constraint(equalTo: Viewbig.trailingAnchor, constant: -20).isActive = true
        textField1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        Viewbig.addSubview(textField2)
        textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 30).isActive = true
        textField2.leadingAnchor.constraint(equalTo: Viewbig.leadingAnchor, constant: 20).isActive = true
        textField2.trailingAnchor.constraint(equalTo: Viewbig.trailingAnchor, constant: -20).isActive = true
        textField2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        Viewbig.addSubview(textField3)
        textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 30).isActive = true
        textField3.leadingAnchor.constraint(equalTo: Viewbig.leadingAnchor, constant: 20).isActive = true
        textField3.trailingAnchor.constraint(equalTo: Viewbig.trailingAnchor, constant: -20).isActive = true
        textField3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        Viewbig.addSubview(imge2)
        imge2.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 30).isActive = true
        imge2.centerXAnchor.constraint(equalTo: Viewbig.centerXAnchor).isActive = true
        imge2.heightAnchor.constraint(equalToConstant: 180).isActive = true
        imge2.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
        
        view.addSubview(btn)
        btn.topAnchor.constraint(equalTo: Viewbig.bottomAnchor, constant: 10).isActive = true
        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(btn2)
        btn2.topAnchor.constraint(equalTo: Viewbig.bottomAnchor, constant: 10).isActive = true
        btn2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        btn2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        btn2.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    @objc func TapLogin()  {
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func handTap(){
        presentPhotoActioSheet()
        //                // cach1-1
        //                print("Tap")
        //                let alert:UIAlertController = UIAlertController(title: "Thông Báo", message: "chọn", preferredStyle: UIAlertController.Style.alert)
        //                //khi ấn vào button thì nó sẽ sảy ra hành động
        //                let alertButonPhotto: UIAlertAction = UIAlertAction(title: "PhoTo", style: UIAlertAction.Style.default) { (UIAlertAction) in
        //
        //                    if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
        //
        //                    // sử dụng uiimgePick để truy cập vào thư viện ảnh
        //                    let imgPickker = UIImagePickerController()
        //                    // truy cập vào thứ viện ảnh của máy
        //                    imgPickker.sourceType = .photoLibrary
        //                    // gần giống như tableview
        //                    imgPickker.delegate = self
        //                    // không cho nó thay đổi tấm hính
        //                    imgPickker.allowsEditing = false
        //                    self.present(imgPickker,animated: true, completion: nil)
        //                    } else {
        //                        print("NO Photolibarary")
        //                    }
        //                }
        //
        //
        //                let alertButoncamera:UIAlertAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) { (UIAlertAction) in
        //                    // kiểm tra có camera hay ko
        //                    // có thì thực hiện các hành động sau
        //
        //                    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
        //
        //
        //                    // sử dụng uiimgePick để truy cập vào thư viện ảnh
        //                    let imgPickker = UIImagePickerController()
        //                    // truy cập vào máy ảnh của máy
        //                    imgPickker.sourceType = .camera
        //                    imgPickker.delegate = self
        //                    // không cho nó thay đổi tấm hính
        //                    imgPickker.allowsEditing = false
        //                    self.present(imgPickker,animated: true, completion: nil)
        //                    } else {
        //                        print("No Camera")
        //                    }
        //
        //
        //
        //                }
        //                alert.addAction(alertButonPhotto)
        //                alert.addAction(alertButoncamera)
        //
        //                self.present(alert,animated: true,completion: nil)
        
        
    }
    
    @objc func Tap(){
        // bước 3
        let email: String = textField.text!
        let passwword: String = textField1.text!
        
        Auth.auth().createUser(withEmail: email, password: passwword) { (Authr, error) in
            // nếu eror == nil có nghĩa là ko có nỗi thì chúng ta thực hiện việc gì đó
            if error == nil {
                
                
                // theo thứ tự ta vua đăng ký xong nó ko có lỗi thi tta cho nó đăng nhập luôn
                Auth.auth().signIn(withEmail: email, password: passwword) { (user, error) in
                    // ko có nỗi
                    if error == nil{
                        
                        let alert: UIAlertController = UIAlertController(title: "Thông Báo", message: "Đăng Ký Thành Công", preferredStyle: UIAlertController.Style.alert)
                       
                        let btn : UIAlertAction = UIAlertAction(title: "ok", style: .default) { (gotochar) in
                            
                            let vc = CharViewController()
                              let nav: UINavigationController = UINavigationController(rootViewController: vc)
                              nav.modalPresentationStyle = .fullScreen
                            self.present(nav,animated: true, completion: nil)
                            
                        }
                        alert.addAction(btn)
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    
                }
                // khi đăng nhập thành công
                
                
                // khởi tạo một dường dẫn để tải ảnh lên firebase
                // khi đăng nhập thành công ta đã có email của nó chuyền cái email vào đó thì sẽ ko trung nhau
                // có imail của user thì nó sẽ có ảnh của user đó
                let avartarRef = storageRef.child("images/\(email).jpg")
                // Upload the file to the path "images/rivers.jpg"
                let uploadTask = avartarRef.putData(self.imgDAta, metadata: nil) { (metadata, error) in
                    guard let metadata = metadata else {
                        print("lỗi up hình avarta")
                        return
                    }
                    // Metadata contains file metadata such as size, content-type.
                    let size = metadata.size
                    avartarRef.downloadURL { (url, error) in
                        guard let downloadURL = url else {
                            //                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                            //                        changeRequest?.displayName = self.textField3.text
                            //                        changeRequest?.photoURL = url
                            //                        changeRequest?.commitChanges { (error) in
                            //                         print("tải về thàh công")
                            //                        }
                            // cach2
                            // Update a user's profile
                            // kiểm tra xem ngưới nhập đãn đăng nhập hay chua
                            let users = Auth.auth().currentUser
                            // nếu đăng nhập rồi thì mới xảy ra việc đưới đây
                            
                            if let user = users{
                                
                                let changRequest = user.createProfileChangeRequest()
                                
                                // nếu đã đăng nhập rồi nó sẽ cho chúng ra làm những việc như
                                // thay dổi tên hiển thị
                                changRequest.displayName = self.textField3.text!
                                
                                // thay đổi ảnh photoUrl thành đoạn url để nó lưu tấm hình
                                
                                //  up một cái tấm hình nên ta cần thêm import một cái thú viện nữa đó
                                //https://firebase.google.com/docs/storage/ios/start
                                //pod 'Firebase/Storage'
                                
                                changRequest.photoURL = url
                            }
                            // ngược lại thì bật thông báo có lỗi
                            return
                        }
                    }
                }
                uploadTask.resume()
                
                
                
            } else {
                let alert: UIAlertController = UIAlertController(title: "Thông Báo", message: "Đăng nhập không thành công \n Hãy kiểm tra lại tài khoản của bạn \n Xin cảm ơn", preferredStyle: UIAlertController.Style.alert)
                let btn: UIAlertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                alert.addAction(btn)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
}
//
//// chèn thêm hai thư viện để sử dụng thư viên ảnh của máy
//extension MainRegisterViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//
//    // khi cọn về photo hay camera nó sẽ chọn vào hàm bên dưới này
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//       // info là biến mà hàm trên cung cấp
//        // khi chúng ta chọn hình thì nó sẽ chả về cho chúng ta một cái info và chúng ra cũng chưa biết nó kiểu gì thì ta ép nó về kiểu image
//        let chooseimage = info[.originalImage] as! UIImage
//        // tại vì ảnh của các máy iphone 10 11 co độ phân giai cao nên ta phải   giảm độ phân giải của tấm hình để up lên cerver
//        // khiểm tra kích thươc tâm hình đã đọn bằng bao nhiêu
//        let imgvalue = max(chooseimage.size.width,chooseimage.size.height)
//
//        if(imgvalue > 2000){
//            // nếu imgeValue này lớn hơn 3000 thì cho độ phân giải tấm hình giảm nhỏ nhất ta tạo một biến var imgeData: Data!
//            // dể giảm đọ phân giải tao làm như sau
//            imgDAta = chooseimage.jpegData(compressionQuality: 0.1)
//        } else  if (imgvalue > 1000){
//            imgDAta = chooseimage.jpegData(compressionQuality: 0.3)
//
//
//        }else{
//            imgDAta = chooseimage.pngData()
//        }
//
//        // khi chọn xong rồi tôi lấy cái hình tôi vừa chọn hiển thị ra màn hình luôn
//        imge2.image = UIImage(data: imgDAta)
//
//        // khi chọn xong rồi thì hộp thoại cần đóng đi
//        dismiss(animated: true, completion: nil)
//
//
//
//    }
//}
extension MainRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func  presentPhotoActioSheet() {
        // kiểu thông báo đẩy từ dưới lên
        let actionsheet = UIAlertController(title: "Thông báo ", message: "Bạn sẽ chọn một bức hình bạn yêu thích", preferredStyle: .actionSheet)
        // cách 1 thêm nut trong actionSheet
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,
                                            handler: nil))
        actionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] (camera) in
            self?.presentCamera()
        }))
        actionsheet.addAction(UIAlertAction(title: "Chose Photo", style: .default, handler: { [weak self] (libary) in
            self?.PresentPhotolibary()
        }))
        // cách 2 thêm nut trong actionSheet
        //        let cancle = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        //        actionsheet.addAction(cancle)
        present(actionsheet, animated: true, completion: nil)
    }
    func presentCamera() {
        // nếu có camera thi truy xuát vào
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            // khới tạo biến để truy cập đến tác vụ uiimagePick
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.delegate = self
            vc.allowsEditing = true
            present(vc,animated: true,completion: nil)
        } else {
            let aleart = UIAlertController(title: "Thông báo", message: "đang chạy trên SIMULATOR làm gi có máy ảnh mà chụp ", preferredStyle: .alert)
            aleart.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            present(aleart,animated: true, completion: nil)
        }
    }
    func PresentPhotolibary() {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.delegate = self
            vc.allowsEditing = true
            present(vc,animated: true,completion: nil)
        } else {
            print("không có thư viện ảnh")
        }
    }
    // khi chọn về photo hay camera nó sẽ chọn vào hàm bên dưới này
    // hàm đã kết thúc phương thức truyền thông tin
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        /// cach 1 chọn anh
        // info là biến mà hàm trên cung cấp
        // khi chúng ta chọn hình thì nó sẽ chả về cho chúng ta một cái info và chúng ra cũng chưa biết nó kiểu gì thì ta ép nó về kiểu image
        let chooseimage = info[.originalImage] as! UIImage
        // tại vì ảnh của các máy iphone 10 11 co độ phân giai cao nên ta phải   giảm độ phân giải của tấm hình để up lên cerver
        // khiểm tra kích thươc tâm hình đã đọn bằng bao nhiêu
        let imgvalue = max(chooseimage.size.width,chooseimage.size.height)
        
        if(imgvalue > 2000){
            // nếu imgeValue này lớn hơn 3000 thì cho độ phân giải tấm hình giảm nhỏ nhất ta tạo một biến var imgeData: Data!
            // dể giảm đọ phân giải tao làm như sau
            imgDAta = chooseimage.jpegData(compressionQuality: 0.1)
        } else  if (imgvalue > 1000){
            imgDAta = chooseimage.jpegData(compressionQuality: 0.3)
        }else{
            imgDAta = chooseimage.pngData()
        }
        let acttyvity : UIActivityIndicatorView = UIActivityIndicatorView()
        acttyvity.color = .systemPink
        acttyvity.frame = self.view.frame
        self.view.addSubview(acttyvity)
        acttyvity.center = self.view.center
        acttyvity.startAnimating()
        
        DispatchQueue.global().async {
            for indct in 1...10000{
                print(indct)
            }
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2) {
                DispatchQueue.main.async {
                    // khi chọn xong rồi tôi lấy cái hình tôi vừa chọn hiển thị ra màn hình luôn
                    self.imge2.image = UIImage(data: self.imgDAta)
                    acttyvity.stopAnimating()
                }
            }
        }
        // khi chọn xong rồi thì hộp thoại cần đóng đi
        picker.dismiss(animated: true, completion: nil)
    }
}
