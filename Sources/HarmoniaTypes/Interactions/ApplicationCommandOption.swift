//
//  ApplicationCommandOption.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/1.
//

import Foundation

public enum ApplicationCommandOptionType: Int, Codable {
    case SUB_COMMAND = 1, SUB_COMMAND_GROUP, STRING, INTEGER, BOOLEAN, USER,
         CHANNEL, ROLE, MENTIONALBE, NUMBER, ATTACHMENT
}

public struct ApplicationCommandOptionChoice: Codable {
    public enum Value: Codable {
        case string(String)
        case integer(Int)
        case double(Double)
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            if let string = try? container.decode(String.self) {
                self = .string(string)
            } else if let int = try? container.decode(Int.self) {
                self = .integer(int)
            } else if let double = try? container.decode(Double.self) {
                self = .double(double)
            } else {
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to decode ApplicationCommandInteractionDataOption.Value")
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            
            switch self {
            case .string(let string):
                try container.encode(string)
            case .integer(let int):
                try container.encode(int)
            case .double(let double):
                try container.encode(double)
            }
        }
    }

    public var name: String
    public var name_localizations: Nullable<[Locales: String]?>
    public var value: Value
}

public protocol ApplicationCommandOptionBase: Codable {
    var type: ApplicationCommandOptionType { get set }
    var name: String { get set }
    var name_localizations: Nullable<[Locales: String]?> { get set }
    var description: String { get set }
    var description_localizations: Nullable<[Locales: String]?> { get set }
}

public enum ApplicationCommandOption: Codable {
    public struct SubCommand: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var options: [ApplicationCommandOption]?
    }

    public struct SubCommandGroup: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var options: [ApplicationCommandOption]?
    }

    public struct StringOption: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
        public var choices: [ApplicationCommandOptionChoice]?
        public var min_length: Int?
        public var max_length: Int?
        public var autocomplete: Bool?
    }

    public struct Integer: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
        public var choices: [ApplicationCommandOptionChoice]?
        public var min_value: Int?
        public var max_value: Int?
        public var autocomplete: Bool?
    }

    public struct Boolean: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
    }

    public struct User: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
    }

    public struct Channel: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
//        public var channel_types: [ChannelType]?
    }

    public struct Role: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
    }

    public struct Mentionable: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
    }

    public struct Number: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
        public var choices: [ApplicationCommandOptionChoice]?
        public var min_value: Double?
        public var max_value: Double?
        public var autocomplete: Bool?
    }

    public struct Attachment: ApplicationCommandOptionBase {
        public var type: ApplicationCommandOptionType
        public var name: String
        public var name_localizations: Nullable<[Locales : String]?>
        public var description: String
        public var description_localizations: Nullable<[Locales : String]?>
        public var required: Bool?
    }
    
    case subCommand(SubCommand)
    case subCommandGroup(SubCommandGroup)
    case string(StringOption)
    case integer(Integer)
    case boolean(Boolean)
    case user(User)
    case channel(Channel)
    case role(Role)
    case mentionable(Mentionable)
    case number(Number)
    case attachment(Attachment)
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard let type = try? container.decode(ApplicationCommandOptionType.self, forKey: .type) else {
            throw DecodingError.typeMismatch(ApplicationCommandOption.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
        }
        let singleValueContainer = try decoder.singleValueContainer()
        switch type {
        case .SUB_COMMAND:
            self = ApplicationCommandOption.subCommand(try singleValueContainer.decode(ApplicationCommandOption.SubCommand.self))
        case .SUB_COMMAND_GROUP:
            self = ApplicationCommandOption.subCommandGroup(try singleValueContainer.decode(ApplicationCommandOption.SubCommandGroup.self))
        case .STRING:
            self = ApplicationCommandOption.string(try singleValueContainer.decode(ApplicationCommandOption.StringOption.self))
        case .INTEGER:
            self = ApplicationCommandOption.integer(try singleValueContainer.decode(ApplicationCommandOption.Integer.self))
        case .BOOLEAN:
            self = ApplicationCommandOption.boolean(try singleValueContainer.decode(ApplicationCommandOption.Boolean.self))
        case .USER:
            self = ApplicationCommandOption.user(try singleValueContainer.decode(ApplicationCommandOption.User.self))
        case .CHANNEL:
            self = ApplicationCommandOption.channel(try singleValueContainer.decode(ApplicationCommandOption.Channel.self))
        case .ROLE:
            self = ApplicationCommandOption.role(try singleValueContainer.decode(ApplicationCommandOption.Role.self))
        case .MENTIONALBE:
            self = ApplicationCommandOption.mentionable(try singleValueContainer.decode(ApplicationCommandOption.Mentionable.self))
        case .NUMBER:
            self = ApplicationCommandOption.number(try singleValueContainer.decode(ApplicationCommandOption.Number.self))
        case .ATTACHMENT:
            self = ApplicationCommandOption.attachment(try singleValueContainer.decode(ApplicationCommandOption.Attachment.self))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .subCommand(let value):
            try container.encode(value)
        case .subCommandGroup(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .integer(let value):
            try container.encode(value)
        case .boolean(let value):
            try container.encode(value)
        case .user(let value):
            try container.encode(value)
        case .channel(let value):
            try container.encode(value)
        case .role(let value):
            try container.encode(value)
        case .mentionable(let value):
            try container.encode(value)
        case .number(let value):
            try container.encode(value)
        case .attachment(let value):
            try container.encode(value)
        }
    }
}

public enum EntryPointCommandHandlerType: Int, Codable {
    case APP_HANDLER = 1, DISCORD_LAUNCH_ACTIVITY
}
