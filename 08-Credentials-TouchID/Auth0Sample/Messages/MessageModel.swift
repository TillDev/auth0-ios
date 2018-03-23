//
//  MessageModel.swift
//  Auth0Sample
//
//  Created by AndreTill on 23.03.2018.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class Message: NSObject {
    var author: String = ""
    var subject: String = ""
    var body: String = ""
    var color: UIColor! = nil
    
    init(clr: UIColor, author: String, subject: String!, body: String) {
        super.init()
        self.color = clr
        self.author = author
        
        self.subject = subject
        self.body = body
    }
}
