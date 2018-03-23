//
//  ProfileViewController.swift
//  Auth0Sample
//
//  Created by AndreTill on 23.03.2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit
import Auth0
import RAMAnimatedTabBarController

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    //Profile Items
    @IBOutlet weak var l_name: UILabel!
    @IBOutlet weak var l_email: UILabel!
    
    
    var infoItems = [String : String]()
    
    var profile: UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let profile = SessionManager.shared.profile else { return }
        l_name.text = profile.name
        l_email.text = profile.givenName
        guard let pictureURL = profile.picture else { return }
        let task = URLSession.shared.dataTask(with: pictureURL) { (data, response, error) in
            guard let data = data , error == nil else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        let auth0 = Auth0.webAuth()
        auth0.clearSession(federated: true) { outcome in
            print("Logout Called: \(outcome))")
            DispatchQueue.main.async {
                _ = SessionManager.shared.logout()
                self.presentingViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}
