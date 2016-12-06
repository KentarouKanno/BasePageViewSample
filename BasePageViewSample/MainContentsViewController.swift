//
//  MainContentsViewController.swift
//  BasePageViewSample
//
//  Created by Kentarou on 2016/12/03.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit
import UserNotifications

class MainContentsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // ログアウト → ログイン画面へ
    @IBAction func pushToLogin(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: .pushToLogin, object: nil)
    }
}


