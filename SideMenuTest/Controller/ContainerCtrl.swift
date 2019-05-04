//
//  ContainerCtrl.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/04/30.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

class ContainerCtrl: UIViewController {
    
    // Properties
    
    var menuController: MenuCtrl!
    var centerController: UIViewController!
    var isExpanded = false
    
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeCtrl()
        
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    //Handlers
    
    func configureHomeCtrl() {
        //Homeコントローラをインスタンス化
        let homeController  = HomeCtrl()
        homeController.delegate = self
        
        //NavigationControllerに
        centerController = UINavigationController(rootViewController: homeController)
        
        //Home画面を表示
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
    }
    
        //SideMenuボタン押下時にメニューの種類を設定する処理（Hideするときは処理しない）
    func configureMenuCtrl() {
        if menuController == nil {
            //MenuCtrl.swiftに記載したViewの内容を表示する
            menuController = MenuCtrl()
            menuController.delegate = self
            
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)

        }
    }
    
    //Sidemenuの表示、非表示をアニメーションする処理
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
                           options: .curveEaseInOut, animations: {
                            self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                            
            }, completion: nil)
        }else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
                           options: .curveEaseInOut, animations: {
                            
                self.centerController.view.frame.origin.x = 0
                            
            }) { (_) in
                //どのコンテンツを選択したか出力する処理へ
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        //Showの時もHideの時も処理実施
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        
        switch menuOption {
        case .Profile:
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notification:
            print("Show Notification")
        case .Setting:
            let controller = SettingCtrl()
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
            print("Show Setting")
        }
    }
    
   func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                        self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

//
extension ContainerCtrl: HomeControllerDelegate {
    
    func handMenuToggle(forMenuOption menuOption: MenuOption?) {
        //isExpandedがfalseの場合（Sidemenuトグルをタップした場合）
        if !isExpanded {
            //menuコンテンツを表示する処理へ
            configureMenuCtrl()
            
        }
        isExpanded = !isExpanded

        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }


}
