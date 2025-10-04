//
//  Permissions.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public struct Permissions: OptionSet, CustomStringConvertible, Codable {
    public var description: String {
        "\(rawValue)"
    }

    public var rawValue: Int64

    public init(rawValue: Int64) {
        self.rawValue = rawValue
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int64.self)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode("\(rawValue)")
    }

    nonisolated(unsafe) static let CREATE_INSTANT_INVITE = Permissions(rawValue: 1 << 0)
    nonisolated(unsafe) static let KICK_MEMBERS = Permissions(rawValue: 1 << 1)
    nonisolated(unsafe) static let BAN_MEMBERS = Permissions(rawValue: 1 << 2)
    nonisolated(unsafe) static let ADMINISTRATOR = Permissions(rawValue: 1 << 3)
    nonisolated(unsafe) static let MANAGE_CHANNELS = Permissions(rawValue: 1 << 4)
    nonisolated(unsafe) static let MANAGE_GUILD = Permissions(rawValue: 1 << 5)
    nonisolated(unsafe) static let ADD_REACTIONS = Permissions(rawValue: 1 << 6)
    nonisolated(unsafe) static let VIEW_AUDIT_LOG = Permissions(rawValue: 1 << 7)
    nonisolated(unsafe) static let PRIORITY_SPEAKER = Permissions(rawValue: 1 << 8)
    nonisolated(unsafe) static let STREAM = Permissions(rawValue: 1 << 9)
    nonisolated(unsafe) static let VIEW_CHANNEL = Permissions(rawValue: 1 << 10)
    nonisolated(unsafe) static let SEND_MESSAGES = Permissions(rawValue: 1 << 11)
    nonisolated(unsafe) static let SEND_TTS_MESSAGES = Permissions(rawValue: 1 << 12)
    nonisolated(unsafe) static let MANAGE_MESSAGES = Permissions(rawValue: 1 << 13)
    nonisolated(unsafe) static let EMBED_LINKS = Permissions(rawValue: 1 << 14)
    nonisolated(unsafe) static let ATTACH_FILES = Permissions(rawValue: 1 << 15)
    nonisolated(unsafe) static let READ_MESSAGE_HISTORY = Permissions(rawValue: 1 << 16)
    nonisolated(unsafe) static let MENTION_EVERYONE = Permissions(rawValue: 1 << 17)
    nonisolated(unsafe) static let USE_EXTERNAL_EMOJIS = Permissions(rawValue: 1 << 18)
    nonisolated(unsafe) static let VIEW_GUILD_INSIGHTS = Permissions(rawValue: 1 << 19)
    nonisolated(unsafe) static let CONNECT = Permissions(rawValue: 1 << 20)
    nonisolated(unsafe) static let SPEAK = Permissions(rawValue: 1 << 21)
    nonisolated(unsafe) static let MUTE_MEMBERS = Permissions(rawValue: 1 << 22)
    nonisolated(unsafe) static let DEAFEN_MEMBERS = Permissions(rawValue: 1 << 23)
    nonisolated(unsafe) static let MOVE_MEMBERS = Permissions(rawValue: 1 << 24)
    nonisolated(unsafe) static let USE_VAD = Permissions(rawValue: 1 << 25)
    nonisolated(unsafe) static let CHANGE_NICKNAME = Permissions(rawValue: 1 << 26)
    nonisolated(unsafe) static let MANAGE_NICKNAMES = Permissions(rawValue: 1 << 27)
    nonisolated(unsafe) static let MANAGE_ROLES = Permissions(rawValue: 1 << 28)
    nonisolated(unsafe) static let MANAGE_WEBHOOKS = Permissions(rawValue: 1 << 29)
    nonisolated(unsafe) static let MANAGE_GUILD_EXPRESSIONS = Permissions(rawValue: 1 << 30)
    nonisolated(unsafe) static let USE_APPLICATION_COMMANDS = Permissions(rawValue: 1 << 31)
    nonisolated(unsafe) static let REQUEST_TO_SPEAK = Permissions(rawValue: 1 << 32)
    nonisolated(unsafe) static let MANAGE_EVENTS = Permissions(rawValue: 1 << 33)
    nonisolated(unsafe) static let MANAGE_THREADS = Permissions(rawValue: 1 << 34)
    nonisolated(unsafe) static let CREATE_PUBLIC_THREADS = Permissions(rawValue: 1 << 35)
    nonisolated(unsafe) static let CREATE_PRIVATE_THREADS = Permissions(rawValue: 1 << 36)
    nonisolated(unsafe) static let USE_EXTERNAL_STICKERS = Permissions(rawValue: 1 << 37)
    nonisolated(unsafe) static let SEND_MESSAGES_IN_THREADS = Permissions(rawValue: 1 << 38)
    nonisolated(unsafe) static let USE_EMBEDDED_ACTIVITIES = Permissions(rawValue: 1 << 39)
    nonisolated(unsafe) static let MODERATE_MEMBERS = Permissions(rawValue: 1 << 40)
    nonisolated(unsafe) static let VIEW_CREATOR_MONETIZATION_ANALYTICS = Permissions(rawValue: 1 << 41)
    nonisolated(unsafe) static let USE_SOUNDBOARD = Permissions(rawValue: 1 << 42)
    nonisolated(unsafe) static let CREATE_GUILD_EXPRESSIONS = Permissions(rawValue: 1 << 43)
    nonisolated(unsafe) static let CREATE_EVENTS = Permissions(rawValue: 1 << 44)
    nonisolated(unsafe) static let USE_EXTERNAL_SOUNDS = Permissions(rawValue: 1 << 45)
    nonisolated(unsafe) static let SEND_VOICE_MESSAGES = Permissions(rawValue: 1 << 46)
    nonisolated(unsafe) static let SEND_POLLS = Permissions(rawValue: 1 << 49)
    nonisolated(unsafe) static let USE_EXTERNAL_APPS = Permissions(rawValue: 1 << 50)
    nonisolated(unsafe) static let PIN_MESSAGES = Permissions(rawValue: 1 << 51)
}
