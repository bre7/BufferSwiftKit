//
//  Networking.swift
//  BufferKit
//
//  Created by Humberto Aquino on 2/14/16.
//  Copyright © 2016 Buffer. All rights reserved.
//

import Foundation
import Moya

public enum BufferAPI: TargetType {
    case User
    case UserDeauthorize
    case Profiles
    case Profile(String)
}

public extension BufferAPI {
    var baseURL: NSURL { return NSURL(string: "https://api.bufferapp.com/1")! }
    var path: String {
        switch self {
        case .User:
            return "/user.json"
        case .UserDeauthorize:
            return "/user/deauthorize.json"
        case .Profiles:
            return "/profiles.json"
        case .Profile(let id):
            return "/profiles/\(id).json"
        }
    }
    var method: Moya.Method {
        switch self {
        case .User:
            return .GET
        case .UserDeauthorize:
            return .POST
        case .Profiles:
            return .GET
        case.Profile(_):
            return .GET
        }
    }

    var parameters: [String: AnyObject]? {
        return nil
    }

    // Not using this but adding a non nil return value to conform protocol
    var sampleData: NSData {
        return "Something".dataUsingEncoding(NSUTF8StringEncoding)!
    }
}
