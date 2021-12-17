//
//  VKGroup.swift
//  vkAppSwiftUI
//
//  Created by Евгений Дегтярев on 17.12.2021.
//

import Foundation
import SwiftyJSON

struct VKGroup {
    let id: Int
    let name: String
    let avatarURL: URL
    let isMember: Bool
}

extension VKGroup {
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.avatarURL = json["photo_200"].url!
        self.isMember = json["is_member"].boolValue
    }
}
