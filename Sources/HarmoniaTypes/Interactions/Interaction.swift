//
//  Interaction.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public enum InteractionType: Int, Codable {
    case PING = 1, APPLICATION_COMMAND, MESSAGE_COMPONENT, APPLICATION_COMMAND_AUTOCOMPLETE, MODAL_SUBMIT
}

public enum InteractionContextType: Int, Codable {
    case GUILD = 0, BOT_DM, PRIVATE_CHANNEL
}

public enum InteractionData: Codable {
    case applicationCommand(ApplicationCommandData)
    case messageComponent(MessageComponentData)
    case modalSubmit(ModalSubmitData)
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .applicationCommand(let value):
            try container.encode(value)
        case .messageComponent(let value):
            try container.encode(value)
        case .modalSubmit(let value):
            try container.encode(value)
        }
    }
}

public struct Interaction: Codable {
    public var id: Snowflake
    public var application_id: Snowflake
    public var type: InteractionType
    public var data: InteractionData?
//    public var guild: PartialGuild?
    public var guild_id: Snowflake?
//    public var channel: PartialChannel?
    public var channel_id: Snowflake?
//    public var member: Member?
//    public var user: User?
    public var token: String
    public var version: Int
//    public var message: Message?
    public var app_permissions: String
    public var locale: Locales?
    public var guild_locale: Locales?
//    public var entitlements: [Entitlement]
    public var authorizing_integration_owners: [ApplicationIntegrationType: Snowflake]
    public var context: InteractionContextType?
    public var attachment_size_limit: Int
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Snowflake.self, forKey: .id)
        self.application_id = try container.decode(Snowflake.self, forKey: .application_id)
        self.type = try container.decode(InteractionType.self, forKey: .type)
        switch self.type {
        case .PING:
            self.data = nil
        case .APPLICATION_COMMAND:
            guard var data = try container.decodeIfPresent(ApplicationCommandData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .applicationCommand(data)
        case .MESSAGE_COMPONENT:
            guard var data = try container.decodeIfPresent(MessageComponentData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .messageComponent(data)
        case .APPLICATION_COMMAND_AUTOCOMPLETE:
            guard var data = try container.decodeIfPresent(ApplicationCommandData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .applicationCommand(data)
        case .MODAL_SUBMIT:
            guard var data = try container.decodeIfPresent(ModalSubmitData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .modalSubmit(data)
        }
        self.guild_id = try container.decodeIfPresent(Snowflake.self, forKey: .guild_id)
        self.channel_id = try container.decodeIfPresent(Snowflake.self, forKey: .channel_id)
        self.token = try container.decode(String.self, forKey: .token)
        self.version = try container.decode(Int.self, forKey: .version)
        self.app_permissions = try container.decode(String.self, forKey: .app_permissions)
        self.locale = try container.decodeIfPresent(Locales.self, forKey: .locale)
        self.guild_locale = try container.decodeIfPresent(Locales.self, forKey: .guild_locale)
        self.authorizing_integration_owners = try container.decode([ApplicationIntegrationType: Snowflake].self, forKey: .authorizing_integration_owners)
        self.context = try container.decodeIfPresent(InteractionContextType.self, forKey: .context)
        self.attachment_size_limit = try container.decode(Int.self, forKey: .attachment_size_limit)
    }
}

public enum InteractionCallbackType: Int, Codable {
    case PONG = 1
    case CHANNEL_MESSAGE_WITH_SOURCE = 4, DEFERRED_CHANNEL_MESSAGE_WITH_SOURCE, DEFERRED_UPDATE_MESSAGE,
         UPDATE_MESSAGE, APPLICATION_COMMAND_AUTOCOMPLETE_RESULT, MODAL, PREMIUM_REQUIRED
    case LAUNCH_ACTIVITY = 12
}

public enum InteractionCallbackData: Codable {
    case message(MessageInteractionCallbackData)
    case autocomplete(AutocompleteInteractionCallbackData)
    case modal(ModalInteractionCallbackData)
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .message(let value):
            try container.encode(value)
        case .autocomplete(let value):
            try container.encode(value)
        case .modal(let value):
            try container.encode(value)
        }
    }
}

public struct InteractionResponse: Codable {
    public var type: InteractionCallbackType
    public var data: InteractionCallbackData?
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(InteractionCallbackType.self, forKey: .type)
        switch self.type {
        case .CHANNEL_MESSAGE_WITH_SOURCE:
            fallthrough
        case .DEFERRED_CHANNEL_MESSAGE_WITH_SOURCE:
            fallthrough
        case .DEFERRED_UPDATE_MESSAGE:
            fallthrough
        case .UPDATE_MESSAGE:
            guard var data = try container.decodeIfPresent(MessageInteractionCallbackData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .message(data)
        case .APPLICATION_COMMAND_AUTOCOMPLETE_RESULT:
            guard var data = try container.decodeIfPresent(AutocompleteInteractionCallbackData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .autocomplete(data)
        case .MODAL:
            guard var data = try container.decodeIfPresent(ModalInteractionCallbackData.self, forKey: .data) else {
                self.data = nil
                break
            }
            self.data = .modal(data)
        default:
            self.data = nil
        }
    }
}

public struct InteractionCallback: Codable {
    public var id: Snowflake
    public var type: InteractionType
    public var activity_instance_id: String?
    public var response_message_id: Snowflake?
    public var response_message_loading: Bool?
    public var response_message_ephemeral: Bool?
}

public struct InteractionCallbackActivityInstanceResource: Codable {
    public var id: Snowflake
}

public struct InteractionCallbackResource: Codable {
    public var type: InteractionCallbackType
    public var activity_instance: InteractionCallbackActivityInstanceResource?
//    public var message: Message?
}

public struct InteractionCallbackResponse: Codable {
    public var interaction: InteractionCallback
    public var resource: InteractionResponse?
}
