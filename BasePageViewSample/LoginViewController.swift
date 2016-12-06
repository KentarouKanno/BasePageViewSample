//
//  LoginViewController.swift
//  BasePageViewSample
//
//  Created by Kentarou on 2016/12/03.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // ログイン完了 → メインコンテンツ画面へ
    @IBAction func pushToMainContents(_ sender: UIButton) {
        
       NotificationCenter.default.post(name: .pushToMainContents, object: nil)
    }
}
