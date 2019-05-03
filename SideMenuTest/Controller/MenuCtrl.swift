//
//  MenuCtrl.swift
//  SideMenuTest
//
//  Created by 植田圭祐 on 2019/04/30.
//  Copyright © 2019 Keisuke Ueda. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuCtrl: UIViewController {
    
    // Properties
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("     MenuCtrl.viewDidLoad")
        configureTableView()
    }
    
    //Handlers
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("registar")
        
        //再利用セルの登録
        tableView.register(MenuOptionsCell.self, forCellReuseIdentifier: reuseIdentifer)
        
        //TableViewの設定（色、セパレータの表示形式、１行の高さ）
        tableView.backgroundColor = UIColor(hex: "1D4B69")
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        
        //TableView自体の表示に関する定義
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

//MenuCtrlを拡張（TableViewを表示）
extension MenuCtrl: UITableViewDelegate, UITableViewDataSource {
    //tableViewに表示する行数（コンテンツ数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    //indexPathの位置にあるセルを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionsCell
        
        //行数をMenuOptionに渡して項目名とアイコンを取得
        let menuOption = MenuOption(rawValue: indexPath.row)
        
        //セルにテキストとアイコンをセット
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImage.image = menuOption?.image
        
        return cell
    }
    
        //indexPathのいちにあるセルが選択された時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //行数をMenuOptionに渡して項目名とアイコンを取得
        let menuOption = MenuOption(rawValue: indexPath.row)
        print("******Touch Menu contents - >Go delegate******")
        delegate?.handMenuToggle(forMenuOption: menuOption)
        print("***********************")
        
        guard let text = menuOption?.description else { return }
        print("\(text)が選択されました")
        
        
    }
}
