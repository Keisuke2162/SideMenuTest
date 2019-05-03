//
//  HomeCtrl.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/04/30.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

class HomeCtrl: UIViewController {
    
    // Properties
    
    var delegate: HomeControllerDelegate?
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        print("6 HomeCtrl.viewDidLoad")
        view.backgroundColor = UIColor(hex: "B1C7D4")
        configureNavigationBar()
        
    }
    

    
    //Handlers
    
        //Sidemenuボタンをタッチしたら呼び出し
    @objc func handleToggle() {
        print("*****Touch Toggle*****")
        delegate?.handMenuToggle(forMenuOption: nil)
        print("**********************")
    }
    
    
    func configureNavigationBar() {
        //NavigationBarの色とスタイルを定義
        navigationController?.navigationBar.barTintColor = UIColor(hex: "1D4B69")
        navigationController?.navigationBar.barStyle = .black
        
        //NavigationBarに表示するタイトルとボタンを設定（ボタン押下時の遷移先も記載）
        navigationItem.title = "Side menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-menu-30").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleToggle))
    }
    
}
