//
//  MenuOptionsCell.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/04/30.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

//Sidemenuに表示するセルの設定
class MenuOptionsCell: UITableViewCell {
    
    //Properties
    
        //SideMenuに貼り付ける画像を定義
    let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = ContentMode.scaleAspectFit
        iv.clipsToBounds = true
        //iv.backgroundColor = .blue
        return iv
    }()
    
        //SideMenuに表示するテキストを定義
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Test Text"
        return label
    }()
    
    
    //Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //データを表示するセルについての設定
        backgroundColor = UIColor(hex: "1D4B69")
        
        addSubview(iconImage)
        //Sidemenu内に表示するアイコンの設定（表示場所について）
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(descriptionLabel)
        //Sidemenu内に表示するテキストの設定（表示場所について）
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImage.rightAnchor, constant: 12).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Handlers
}
