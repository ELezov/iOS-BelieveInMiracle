//
//  ViewController.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 09.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {
    
    var activityIndicatorView: UIView?
    
    var keyboardHight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .plain,
                                                           target: nil,
                                                           action: nil)
        configureNotifications()
    }

    func configureNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHight = keyboardSize.height
        }
    }
    
    @objc
    func keyboardWillHide() {
        keyboardHight = 0
    }
    
    
    func showIndicatorView() {
         let indicatorView = NVActivityIndicatorView(frame: view.frame,
                                                     type: NVActivityIndicatorType(rawValue: 10),
                                                     color: UIColor.white,
                                                     padding: nil)
        let containerView = UIView(frame: view.frame)
        containerView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        containerView.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        activityIndicatorView?.removeFromSuperview()
        self.view.addSubview(containerView)
        indicatorView.startAnimating()
        activityIndicatorView = containerView
    }
    
    func hideIndicatorView() {
        activityIndicatorView?.removeFromSuperview()
    }

}
