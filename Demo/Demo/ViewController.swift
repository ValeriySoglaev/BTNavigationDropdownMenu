//
//  ViewController.swift
//  BTNavigationDropdownMenu
//
//  Created by Pham Ba Tho on 6/8/15.
//  Copyright (c) 2015 PHAM BA THO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedCellLabel: UILabel!
    var menuView: BTNavigationDropdownMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let items = [ItemDropdownMenu(item: "Test 1", badge: BadgeStruct(badgeTitle: nil, badgeBackgroundColor: nil, badgeTitleColor: nil, badgeBorderLineColor: nil)),
                     ItemDropdownMenu(item: "Test 2", badge: BadgeStruct(badgeTitle: "new", badgeBackgroundColor: nil, badgeTitleColor: nil, badgeBorderLineColor: nil)),
                     ItemDropdownMenu(item: "Test 3", badge: BadgeStruct(badgeTitle: "5", badgeBackgroundColor: nil, badgeTitleColor: nil, badgeBorderLineColor: nil)),
                     ItemDropdownMenu(item: "Test 4", badge: BadgeStruct(badgeTitle: "95", badgeBackgroundColor: .blue, badgeTitleColor: nil, badgeBorderLineColor: nil)),
                     ItemDropdownMenu(item: "Test 5", badge: BadgeStruct(badgeTitle: "185", badgeBackgroundColor: nil, badgeTitleColor: nil, badgeBorderLineColor: nil))]
        
        self.selectedCellLabel.text = items.first?.item ?? ""
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]

        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: BTTitle.index(2), items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
            print("Did select item at index: \(indexPath)")
            self.selectedCellLabel.text = items[indexPath].item ?? ""
        }
        
        self.navigationItem.titleView = menuView
    }
}
