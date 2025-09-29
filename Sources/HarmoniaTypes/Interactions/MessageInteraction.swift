//
//  MessageInteraction.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/29.
//

import Foundation

public struct MessageInteraction: Codable {
    public var id: Snowflake
    public var type: InteractionType
    public var name: String
//    public var user: User
//    public var member: PartialMember?
}
