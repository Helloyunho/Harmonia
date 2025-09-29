//
//  MessageInteractionCallbackData.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/30.
//

import Foundation

public struct MessageInteractionCallbackData: Codable {
    public var tts: Bool?
    public var content: String?
//    public var embeds: [Embed]?
//    public var allowed_mentions: AllowedMentions?
//    public var flags: MessageFlags?
//    public var components: [Component]?
//    public var attachments: [PartialAttachment]?
//    public var poll: Poll?
}
