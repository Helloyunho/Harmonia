//
//  ApplicationCommand.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/1.
//

import Foundation

public enum ApplicationCommandType: Int, Codable {
    case CHAT_INPUT = 1, USER, MESSAGE, PRIMARY_ENTRY_POINT
}

public protocol ApplicationCommandBase: Codable {
    var id: Snowflake { get set }
    var type: ApplicationCommandType?  { get set }
    var application_id: Snowflake { get set }
    var guild_id: Snowflake? { get set }
    var name: String { get set }
    var name_localizations: Nullable<[Locales: String]?> { get set }
    var description: String { get set }
    var description_localizations: Nullable<[Locales: String]?> { get set }
    var default_member_permissions: Nullable<String> { get set }
    var dm_permission: Bool? { get set }
    var default_permission: Nullable<Bool?> { get set }
    var nsfw: Bool? { get set }
    var integration_types: [ApplicationIntegrationType]? { get set }
    var contexts: Nullable<[InteractionContextType]?> { get set }
    var version: Snowflake { get set }
}

public enum ApplicationCommand: Codable {
    public struct Default: ApplicationCommandBase {
        public var id: Snowflake
        public var type: ApplicationCommandType?
        public var application_id: Snowflake
        public var guild_id: Snowflake?
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var default_member_permissions: Nullable<String>
        public var dm_permission: Bool?
        public var default_permission: Nullable<Bool?>
        public var nsfw: Bool?
        public var integration_types: [ApplicationIntegrationType]?
        public var contexts: Nullable<[InteractionContextType]?>
        public var version: Snowflake
    }
    
    public struct ChatInput: ApplicationCommandBase {
        public var id: Snowflake
        public var type: ApplicationCommandType?
        public var application_id: Snowflake
        public var guild_id: Snowflake?
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var default_member_permissions: Nullable<String>
        public var dm_permission: Bool?
        public var default_permission: Nullable<Bool?>
        public var nsfw: Bool?
        public var integration_types: [ApplicationIntegrationType]?
        public var contexts: Nullable<[InteractionContextType]?>
        public var version: Snowflake
        public var options: [ApplicationCommandOption]
    }
    
    public struct PrimaryEntryPoint: ApplicationCommandBase {
        public var id: Snowflake
        public var type: ApplicationCommandType?
        public var application_id: Snowflake
        public var guild_id: Snowflake?
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var default_member_permissions: Nullable<String>
        public var dm_permission: Bool?
        public var default_permission: Nullable<Bool?>
        public var nsfw: Bool?
        public var integration_types: [ApplicationIntegrationType]?
        public var contexts: Nullable<[InteractionContextType]?>
        public var version: Snowflake
        public var handler: EntryPointCommandHandlerType?
    }
    
    case `default`(Default)
    case chatInput(ChatInput)
    case primaryEntryPoint(PrimaryEntryPoint)
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleValueContainer = try decoder.singleValueContainer()
        guard let type = try container.decodeIfPresent(ApplicationCommandType.self, forKey: .type) else {
            self = try .default(singleValueContainer.decode(Default.self))
            return
        }
        switch type {
        case .CHAT_INPUT:
            self = try .chatInput(singleValueContainer.decode(ChatInput.self))
        case .PRIMARY_ENTRY_POINT:
            self = try .primaryEntryPoint(singleValueContainer.decode(PrimaryEntryPoint.self))
        default:
            self = try .default(singleValueContainer.decode(Default.self))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .default(let value):
            try container.encode(value)
        case .chatInput(let value):
            try container.encode(value)
        case .primaryEntryPoint(let value):
            try container.encode(value)
        }
    }
}

public enum ApplicationCommandPermissionType: Int, Codable {
    case ROLE = 1, USER, CHANNEL
}

public struct ApplicationCommandPermissions: Codable {
    public var id: Snowflake
    public var type: ApplicationCommandPermissionType
    public var permission: Bool
}

public struct GuildApplicationCommandPermissions: Codable {
    public var id: Snowflake
    public var application_id: Snowflake
    public var guild_id: Snowflake
    public var permissions: [ApplicationCommandPermissions]
}

public struct CreateGlobalApplicationCommandRequest: Codable {
    public var name: String
    public var name_localizations: Nullable<[Locales : String]?>?
    public var description: String?
    public var description_localizations: Nullable<[Locales : String]?>?
    public var options: [ApplicationCommandOption]?
    public var default_member_permissions: Nullable<String?>
    public var dm_permission: Nullable<Bool?>
    public var default_permission: Bool?
    public var contexts: Nullable<[InteractionContextType]?>
    public var type: ApplicationCommandType?
    public var nsfw: Bool?
}

public struct EditGlobalApplicationCommandRequest: Codable {
    public var name: String?
    public var name_localizations: Nullable<[Locales : String]?>?
    public var description: String?
    public var description_localizations: Nullable<[Locales : String]?>?
    public var options: [ApplicationCommandOption]?
    public var default_member_permissions: Nullable<String?>
    public var dm_permission: Nullable<Bool?>
    public var default_permission: Bool?
    public var contexts: Nullable<[InteractionContextType]?>
    public var nsfw: Bool?
}

public struct CreateGuildApplicationCommandRequest: Codable {
    public var name: String
    public var name_localizations: Nullable<[Locales : String]?>?
    public var description: String?
    public var description_localizations: Nullable<[Locales : String]?>?
    public var options: [ApplicationCommandOption]?
    public var default_member_permissions: Nullable<String?>
    public var default_permission: Bool?
    public var type: ApplicationCommandType?
    public var nsfw: Bool?
}

public struct EditGuildApplicationCommandRequest: Codable {
    public var name: String?
    public var name_localizations: Nullable<[Locales : String]?>?
    public var description: String?
    public var description_localizations: Nullable<[Locales : String]?>?
    public var options: [ApplicationCommandOption]?
    public var default_member_permissions: Nullable<String?>
    public var default_permission: Bool?
    public var nsfw: Bool?
}

public struct BulkOverwriteGuildApplicationCommandsRequest: Codable {
    public var id: Snowflake?
    public var name: String
    public var name_localizations: Nullable<[Locales : String]?>?
    public var description: String
    public var description_localizations: Nullable<[Locales : String]?>?
    public var options: [ApplicationCommandOption]?
    public var default_member_permissions: Nullable<String?>
    public var dm_permission: Nullable<Bool?>
    public var default_permission: Bool?
    public var contexts: [InteractionContextType]
    public var type: ApplicationCommandType?
    public var nsfw: Bool?
}

public struct EditApplicationCommandPermissionsRequest: Codable {
    public var permissions: [ApplicationCommandPermissions]
}
