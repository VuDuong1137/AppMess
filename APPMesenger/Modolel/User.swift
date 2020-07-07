//
//  User.swift
//  APPMesenger
//
//  Created by Dương chãng on 7/6/20.
//  Copyright © 2020 macshop. All rights reserved.
//
import UIKit
import Foundation
import Firebase
import FirebaseDatabase
//  để lưu một user lên firebase thì ta phải có một đối tượng chứa dữ liệu


struct Userss {
    let id : String!
    let email: String!
    let fullname: String!
    let linkAvarvatar: String!
    //khi chat vs nhau tấm hình hiển thị trên list chat được sử sụng liên tục ta phải lưu tấm hình nay ở local để ta tái sử dụng no
    let Avatar: UIImage!
    // khi các đối tượng có các thuộc tính ta cần phải khợi tạo cho nó
    init() {
        id = ""
        email = ""
        fullname = ""
        linkAvarvatar = ""
        // khi truy xuất đến thuộc tính của một đối tượng nó = nil thi sẽ bị ráp app
        Avatar = UIImage(named: "contacts-blue")
    }
    
    // hàm khởi tạo truyền tham số
    init(Id: String, Email: String, fullname: String, LinkAvatar: String) {
        id = Id
        email = Email
    // nếu đặt trùng tên ta dùng self để gán dữ liệu khởi tạo bằng dữ liệu khởi tạo truyền tham số
            self.fullname = fullname
        linkAvarvatar = LinkAvatar
        Avatar = UIImage(named: "contacts-blue")
    }
}

