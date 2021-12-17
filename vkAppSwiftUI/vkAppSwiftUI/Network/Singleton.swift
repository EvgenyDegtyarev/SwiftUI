//
//  Singleton.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    private init() { }
    
    var userId: Int?
    var token: String = ""
    var myID: String = ""
    var appID: Int = 8022612
    var accessKey = "wpUjRjUMzlfC2WYaZ0C9"
}
