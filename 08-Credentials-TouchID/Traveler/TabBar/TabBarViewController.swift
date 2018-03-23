//
//  TabBarViewController.swift
//  Auth0Sample
//
//  Created by AndreTill on 23.03.2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit
import Spruce
import RAMAnimatedTabBarController

class TabBarViewController: RAMAnimatedTabBarController {

    @IBOutlet weak var tbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Messages
        let msgsVC = SpruceTableViewControllerExample(animations: [.slide(.left, .severely),.fadeIn])
        let tbItem = RAMAnimatedTabBarItem(title: "Сообщения", image: UIImage.init(named: "Image"), tag: 0)
        tbItem.animation = RAMRotationAnimation()
        msgsVC.tabBarItem = tbItem
        
        //Profile
        let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let profTBItem = RAMAnimatedTabBarItem(title: "Профиль", image: UIImage.init(named: "Tools_00028"), tag: 1)
        let profTBIAnimation = RAMFrameItemAnimation.init()
        profTBIAnimation.isDeselectAnimation = true
        profTBIAnimation.imagesPath = "ToolsAnimation"
        profTBItem.animation = profTBIAnimation
        profileVC.tabBarItem = profTBItem
        
        //Add Tabs
        self.viewControllers?.append(msgsVC)
        self.viewControllers?.append(profileVC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
