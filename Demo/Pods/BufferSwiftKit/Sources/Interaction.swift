//
//  Interaction.swift
//  BufferKitDemo
//
//  Created by Humberto Aquino on 3/6/16.
//  Copyright © 2016 Buffer. All rights reserved.
//

import Foundation
import ObjectMapper


public struct Interaction: Mappable {

    public var createdAt: NSDate?
    public var event: String?
    public var id: String?
    public var interactionId: String?
    public var updateId: String?
    public var user: SocialNetUser?

    public init?(_ map: Map) {

    }

    public mutating func mapping(map: Map) {
        createdAt <- map[Keys.createdAt]
        event <- map[Keys.event]
        id <- map[Keys.id]
        interactionId <- map[Keys.interactionId]
        updateId <- map[Keys.updateId]
        user <- map[Keys.user]
    }

}

extension Interaction {
    struct Keys {
        static let createdAt = "created_at"
        static let event = "event"
        static let id = "id"
        static let interactionId = "interaction_id"
        static let updateId = "update_id"
        static let user = "user"
    }
}

// Facebook, Twitter, Linkedin, G+ events
// Note: Keep it simple approach for now by just grouping all events in a single enum
public enum InteractionEvent: String {
    case Mentions = "mentions"
    case Mention = "mention"
    case Retweets = "retweets"
    case Retweet = "retweet"
    case Likes = "likes"
    case Like = "like"
    case Comments = "comments"
    case Comment = "comment"
    case Clicks = "clicks"
    case Click = "click"
    case PlusOnes = "plusOnes"
    case PlusOne = "plusOne"
    case Reshare = "reshares"
    case Reshares = "reshare"
}
