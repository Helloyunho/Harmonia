//
//  Component.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public enum ComponentType: Int, Codable {
    case actionRow = 1, button, stringSelect, textInput, userSelect,
         roleSelect, mentionableSelect, channelSelect, section, textDisplay,
         thumbnail, mediaGallery, file, separator
    case container = 17, label
}

public protocol ComponentBase: Codable {
    var type: ComponentType { get set }
    var id: Int? { get set }
}

public protocol ComponentWithCustomID: Codable, ComponentBase {
    var custom_id: String { get set }
}

public enum Component: Codable {
    case actionRow(ActionRowComponent)
    case button(ButtonComponent)
    case stringSelect(StringSelectComponent)
    case textInput(TextInputComponent)
    case userSelect(UserSelectComponent)
    case roleSelect(RoleSelectComponent)
    case mentionableSelect(MentionableSelectComponent)
    case channelSelect(ChannelSelectComponent)
    case section(SectionComponent)
    case textDisplay(TextDisplayComponent)
    case thumbnail(ThumbnailComponent)
    case mediaGallery(MediaGalleryComponent)
    case file(FileComponent)
    case separator(SeparatorComponent)
    case container(ContainerComponent)
    case label(LabelComponent)
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
            throw DecodingError.typeMismatch(Component.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
        }
        let singleValueContainer = try decoder.singleValueContainer()
        switch type {
        case .actionRow:
            self = .actionRow(try singleValueContainer.decode(ActionRowComponent.self))
        case .button:
            self = .button(try singleValueContainer.decode(ButtonComponent.self))
        case .stringSelect:
            self = .stringSelect(try singleValueContainer.decode(StringSelectComponent.self))
        case .textInput:
            self = .textInput(try singleValueContainer.decode(TextInputComponent.self))
        case .userSelect:
            self = .userSelect(try singleValueContainer.decode(UserSelectComponent.self))
        case .roleSelect:
            self = .roleSelect(try singleValueContainer.decode(RoleSelectComponent.self))
        case .mentionableSelect:
            self = .mentionableSelect(try singleValueContainer.decode(MentionableSelectComponent.self))
        case .channelSelect:
            self = .channelSelect(try singleValueContainer.decode(ChannelSelectComponent.self))
        case .section:
            self = .section(try singleValueContainer.decode(SectionComponent.self))
        case .textDisplay:
            self = .textDisplay(try singleValueContainer.decode(TextDisplayComponent.self))
        case .thumbnail:
            self = .thumbnail(try singleValueContainer.decode(ThumbnailComponent.self))
        case .mediaGallery:
            self = .mediaGallery(try singleValueContainer.decode(MediaGalleryComponent.self))
        case .file:
            self = .file(try singleValueContainer.decode(FileComponent.self))
        case .separator:
            self = .separator(try singleValueContainer.decode(SeparatorComponent.self))
        case .container:
            self = .container(try singleValueContainer.decode(ContainerComponent.self))
        case .label:
            self = .label(try singleValueContainer.decode(LabelComponent.self))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self)
    }
}

public struct ActionRowComponent: ComponentBase {
    public enum Child: Codable {
        case button(ButtonComponent)
        case stringSelect(StringSelectComponent)
        case userSelect(UserSelectComponent)
        case roleSelect(RoleSelectComponent)
        case mentionableSelect(MentionableSelectComponent)
        case channelSelect(ChannelSelectComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .button:
                self = .button(try singleValueContainer.decode(ButtonComponent.self))
            case .stringSelect:
                self = .stringSelect(try singleValueContainer.decode(StringSelectComponent.self))
            case .userSelect:
                self = .userSelect(try singleValueContainer.decode(UserSelectComponent.self))
            case .roleSelect:
                self = .roleSelect(try singleValueContainer.decode(RoleSelectComponent.self))
            case .mentionableSelect:
                self = .mentionableSelect(try singleValueContainer.decode(MentionableSelectComponent.self))
            case .channelSelect:
                self = .channelSelect(try singleValueContainer.decode(ChannelSelectComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }

    public var type: ComponentType = .actionRow
    public var id: Int?
    public var components: [Child]
}

public struct PartialEmoji: Codable {
    public var name: Nullable<String>
    public var id: Nullable<Snowflake>
    public var animated: Bool?
}

public struct ButtonComponent: ComponentBase {
    public enum Style: Int, Codable {
        case primary = 1, secondary, success, danger, link, premium
    }
    
    public var type: ComponentType = .button
    public var id: Int?
    public var style: Style
    public var label: String?
    public var emoji: PartialEmoji?
    public var custom_id: String?
    public var sku_id: Snowflake?
    public var url: String?
    public var disabled: Bool?
}

public struct StringSelectComponent: ComponentWithCustomID {
    public struct Option: Codable {
        public var label: String
        public var value: String
        public var description: String?
        public var emoji: PartialEmoji?
        public var `default`: Bool?
    }

    public var type: ComponentType = .stringSelect
    public var id: Int?
    public var custom_id: String
    public var options: [Option]
    public var placeholder: String?
    public var min_values: Int?
    public var max_values: Int?
    public var required: Bool?
    public var disabled: Bool?
}

public struct StringSelectInteractionResponse: Codable {
    public var type: ComponentType = .stringSelect
    public var component_type: ComponentType = .stringSelect
    public var id: Int
    public var custom_id: String
    public var values: [String]
}

public struct TextInputComponent: ComponentWithCustomID {
    public enum Style: Int, Codable {
        case short = 1, paragraph
    }
    
    public var type: ComponentType
    public var id: Int?
    public var custom_id: String
    public var style: Style
    public var min_length: Int?
    public var max_length: Int?
    public var required: Bool?
    public var value: String?
    public var placeholder: String?
}

public struct TextInputInteractionResponse: Codable {
    public var type: ComponentType = .textInput
    public var id: Int
    public var custom_id: String
    public var value: String
}

public enum SelectDefaultValueType: String, Codable {
    case user
    case role
    case channel
}
public struct SelectDefaultValue: Codable {
    public var id: Snowflake
    public var type: SelectDefaultValueType
}

public struct UserSelectComponent: ComponentWithCustomID {
    public var type: ComponentType = .userSelect
    public var id: Int?
    public var custom_id: String
    public var placeholder: String?
    public var default_values: [SelectDefaultValue]?
    public var min_values: Int?
    public var max_values: Int?
    public var required: Bool?
    public var disabled: Bool?
}

public struct UserSelectInteractionResponse: Codable {
    public var type: ComponentType = .userSelect
    public var component_type: ComponentType = .userSelect
    public var id: Int
    public var custom_id: String
    public var resolved: ResolvedData
    public var values: [Snowflake]
}

public struct RoleSelectComponent: ComponentWithCustomID {
    public var type: ComponentType = .roleSelect
    public var id: Int?
    public var custom_id: String
    public var placeholder: String?
    public var default_values: [SelectDefaultValue]?
    public var min_values: Int?
    public var max_values: Int?
    public var required: Bool?
    public var disabled: Bool?
}

public struct RoleSelectInteractionResponse: Codable {
    public var type: ComponentType = .roleSelect
    public var component_type: ComponentType = .roleSelect
    public var id: Int
    public var custom_id: String
    public var resolved: ResolvedData
    public var values: [Snowflake]
}

public struct MentionableSelectComponent: ComponentWithCustomID {
    public var type: ComponentType = .mentionableSelect
    public var id: Int?
    public var custom_id: String
    public var placeholder: String?
    public var default_values: [SelectDefaultValue]?
    public var min_values: Int?
    public var max_values: Int?
    public var required: Bool?
    public var disabled: Bool?
}

public struct MentionableSelectInteractionResponse: Codable {
    public var type: ComponentType = .mentionableSelect
    public var component_type: ComponentType = .mentionableSelect
    public var id: Int
    public var custom_id: String
    public var resolved: ResolvedData
    public var values: [Snowflake]
}

public struct ChannelSelectComponent: ComponentWithCustomID {
    public var type: ComponentType = .channelSelect
    public var id: Int?
    public var custom_id: String
//    public var channel_types: [ChannelType]?
    public var placeholder: String?
    public var default_values: [SelectDefaultValue]?
    public var min_values: Int?
    public var max_values: Int?
    public var required: Bool?
    public var disabled: Bool?
}

public struct ChannelSelectInteractionResponse: Codable {
    public var type: ComponentType = .channelSelect
    public var component_type: ComponentType = .channelSelect
    public var id: Int
    public var custom_id: String
    public var resolved: ResolvedData
    public var values: [Snowflake]
}

public struct SectionComponent: ComponentBase {
    public enum Child: Codable {
        case textDisplay(TextDisplayComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .textDisplay:
                self = .textDisplay(try singleValueContainer.decode(TextDisplayComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }
    
    public enum Accessory: Codable {
        case button(ButtonComponent)
        case thumbnail(ThumbnailComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .button:
                self = .button(try singleValueContainer.decode(ButtonComponent.self))
            case .thumbnail:
                self = .thumbnail(try singleValueContainer.decode(ThumbnailComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }
    
    public var type: ComponentType = .section
    public var id: Int?
    public var components: [Child]
    public var accessory: Accessory
}

public struct TextDisplayComponent: ComponentBase {
    public var type: ComponentType = .textDisplay
    public var id: Int?
    public var content: String
}

public struct TextDisplayInteractionResponse: Codable {
    public var type: ComponentType = .textDisplay
    public var id: Int
}

public struct UnfuledMediaItem: Codable {
    public var url: String
    /// This field is ignored and provided by the API as part of the response
    public let proxy_url: String?
    /// This field is ignored and provided by the API as part of the response
    public let height: Nullable<Int?>
    /// This field is ignored and provided by the API as part of the response
    public let width: Nullable<Int?>
    /// This field is ignored and provided by the API as part of the response
    public let content_type: String?
    /// This field is ignored and provided by the API as part of the response
    public let attachment_id: Snowflake?
    
    public init(url: String) {
        self.url = url
        proxy_url = nil
        height = nil
        width = nil
        content_type = nil
        attachment_id = nil
    }
}

public struct ThumbnailComponent: ComponentBase {
    public var type: ComponentType = .thumbnail
    public var id: Int?
    public var media: UnfuledMediaItem
    public var description: String?
    public var spoiler: Bool?
}

public struct MediaGalleryComponent: ComponentBase {
    public struct Item: Codable {
        public var media: UnfuledMediaItem
        public var description: String?
        public var spoiler: Bool?
    }
    
    public var type: ComponentType = .mediaGallery
    public var id: Int?
    public var items: [Item]
}

public struct FileComponent: ComponentBase {
    public var type: ComponentType = .file
    public var id: Int?
    /// Only attachment reference (`attachment://<filename>`) is supported.
    public var file: UnfuledMediaItem
    public var spoiler: Bool?
    /// This field is ignored and provided by the API as part of the response
    public let name: String?
    /// This field is ignored and provided by the API as part of the response
    public let size: Int?
    
    init(type: ComponentType, id: Int? = nil, file: UnfuledMediaItem, spoiler: Bool? = nil) {
        self.type = type
        self.id = id
        self.file = file
        self.spoiler = spoiler
        self.name = nil
        self.size = nil
    }
}

public struct SeparatorComponent: ComponentBase {
    public enum Spacing: Int, Codable {
        case small = 1, large
    }
    
    public var type: ComponentType = .separator
    public var id: Int?
    public var divider: Bool?
    public var spacing: Spacing
}

public struct ContainerComponent: ComponentBase {
    public enum Child: Codable {
        case actionRow(ActionRowComponent)
        case textDisplay(TextDisplayComponent)
        case section(SectionComponent)
        case mediaGallery(MediaGalleryComponent)
        case separator(SeparatorComponent)
        case file(FileComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .actionRow:
                self = .actionRow(try singleValueContainer.decode(ActionRowComponent.self))
            case .textDisplay:
                self = .textDisplay(try singleValueContainer.decode(TextDisplayComponent.self))
            case .section:
                self = .section(try singleValueContainer.decode(SectionComponent.self))
            case .mediaGallery:
                self = .mediaGallery(try singleValueContainer.decode(MediaGalleryComponent.self))
            case .separator:
                self = .separator(try singleValueContainer.decode(SeparatorComponent.self))
            case .file:
                self = .file(try singleValueContainer.decode(FileComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }
    
    public var type: ComponentType = .container
    public var id: Int?
    public var components: [Child]
    public var accent_color: Nullable<Int?>
    public var spoiler: Bool?
}

public struct LabelComponent: ComponentBase {
    public enum Child: Codable {
        case textInput(TextInputComponent)
        case stringSelect(StringSelectComponent)
        case userSelect(UserSelectComponent)
        case roleSelect(RoleSelectComponent)
        case mentionableSelect(MentionableSelectComponent)
        case channelSelect(ChannelSelectComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .textInput:
                self = .textInput(try singleValueContainer.decode(TextInputComponent.self))
            case .stringSelect:
                self = .stringSelect(try singleValueContainer.decode(StringSelectComponent.self))
            case .userSelect:
                self = .userSelect(try singleValueContainer.decode(UserSelectComponent.self))
            case .roleSelect:
                self = .roleSelect(try singleValueContainer.decode(RoleSelectComponent.self))
            case .mentionableSelect:
                self = .mentionableSelect(try singleValueContainer.decode(MentionableSelectComponent.self))
            case .channelSelect:
                self = .channelSelect(try singleValueContainer.decode(ChannelSelectComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }
    
    public var type: ComponentType = .label
    public var id: Int?
    public var label: String
    public var description: String?
    public var component: Child
}

public struct LabelInteractionResponse: Codable {
    public enum Child: Codable {
        case textInput(TextInputComponent)
        case stringSelect(StringSelectComponent)
        case userSelect(UserSelectComponent)
        case roleSelect(RoleSelectComponent)
        case mentionableSelect(MentionableSelectComponent)
        case channelSelect(ChannelSelectComponent)
        
        enum CodingKeys: String, CodingKey {
            case type
        }
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
            }
            let singleValueContainer = try decoder.singleValueContainer()
            switch type {
            case .textInput:
                self = .textInput(try singleValueContainer.decode(TextInputComponent.self))
            case .stringSelect:
                self = .stringSelect(try singleValueContainer.decode(StringSelectComponent.self))
            case .userSelect:
                self = .userSelect(try singleValueContainer.decode(UserSelectComponent.self))
            case .roleSelect:
                self = .roleSelect(try singleValueContainer.decode(RoleSelectComponent.self))
            case .mentionableSelect:
                self = .mentionableSelect(try singleValueContainer.decode(MentionableSelectComponent.self))
            case .channelSelect:
                self = .channelSelect(try singleValueContainer.decode(ChannelSelectComponent.self))
            default:
                throw DecodingError.typeMismatch(Child.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
            }
        }
        
        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self)
        }
    }
    
    public var type: ComponentType = .label
    public var id: Int
    public var component: Child
}
