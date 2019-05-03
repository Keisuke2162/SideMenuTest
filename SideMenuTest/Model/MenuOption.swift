//
//  MenuOption.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/05/01.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

//列挙型
enum MenuOption: Int, CustomStringConvertible {
    
    //Sidemenuに表示するメニューのタイトル、画像を格納
    
    case Profile
    case Inbox
    case Notification
    case Setting
    
    //case(0-3)が呼ばれた時に返却するdescription
    var description: String {
        switch self {
            
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notification: return "Notification"
        case .Setting: return "Setting"
        }
    }
    
    //case(0-3)が選択された時に返却するimage
    var image: UIImage {
        switch self {
            
        case .Profile: return UIImage(named: "icons8-user-30") ?? UIImage()
        case .Inbox: return UIImage(named: "icons8-new-post-30") ?? UIImage()
        case .Notification: return UIImage(named: "icons8-menu-30") ?? UIImage()
        case .Setting: return UIImage(named: "icons8-settings-30") ?? UIImage()
        }
    }
}
