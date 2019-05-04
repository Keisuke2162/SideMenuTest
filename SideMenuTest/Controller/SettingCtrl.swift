//
//  SettingCtrl.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/05/04.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

class SettingCtrl: UIViewController {
    
    //Propaties
    
    //Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureUI()
    }
    
    //Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // Helper Function
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Setting"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-multiply-filled-30").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
