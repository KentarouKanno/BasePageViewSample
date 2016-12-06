//
//  BasePageViewController.swift
//  BasePageViewSample
//
//  Created by Kentarou on 2016/12/03.
//  Copyright © 2016年 Kentarou. All rights reserved.
//


import UIKit

extension Notification.Name {
    static let pushToLogin        = Notification.Name("PushToLogin")
    static let pushToMainContents = Notification.Name("PushToMainContents")
}

class BasePageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.pushTologin(_:)), name: .pushToLogin, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.pushToMainContents(_:)), name: .pushToMainContents, object: nil)
        
        if false /* ログインしているかの条件 */ {
            pushToMainContents()
        } else {
            pushTologin()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func pushTologin(_ notification: Notification? = nil) {
        guard let login = login() else {
            return
        }
        self.setViewControllers([login], direction: .forward, animated: true, completion: nil)
    }
    
    func pushToMainContents(_ notification: Notification? = nil) {
        guard let mainContents = mainContents() else {
            return
        }
        self.setViewControllers([mainContents], direction: .forward, animated: true, completion: nil)
    }
    
    private func login() -> UINavigationController? {
        let loginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        guard let navigation = loginStoryboard.instantiateInitialViewController() as? UINavigationController else {
            return nil
        }
        return navigation
    }
    
    private func mainContents() -> UINavigationController? {
        let mainContentsStoryboard = UIStoryboard(name: "MainContents", bundle: nil)
        guard let navigation = mainContentsStoryboard.instantiateInitialViewController() as? UINavigationController else {
            return nil
        }
        return navigation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
