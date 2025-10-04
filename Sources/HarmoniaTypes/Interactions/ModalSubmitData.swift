//
//  ModalSubmitData.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public enum ComponentInteractionResponse: Codable {
    case stringSelect(StringSelectComponent)
    case textInput(TextInputComponent)
    case userSelect(UserSelectComponent)
    case roleSelect(RoleSelectComponent)
    case mentionableSelect(MentionableSelectComponent)
    case channelSelect(ChannelSelectComponent)
    case textDisplay(TextDisplayComponent)
    case label(LabelComponent)
    
    enum CodingKeys: String, CodingKey {
        case type
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard let type = try? container.decode(ComponentType.self, forKey: .type) else {
            throw DecodingError.typeMismatch(ComponentInteractionResponse.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Property `type` not found.", underlyingError: nil))
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
        case .textDisplay:
            self = .textDisplay(try singleValueContainer.decode(TextDisplayComponent.self))
        case .label:
            self = .label(try singleValueContainer.decode(LabelComponent.self))
        default:
            throw DecodingError.typeMismatch(ComponentInteractionResponse.self, DecodingError.Context.init(codingPath: container.codingPath, debugDescription: "Unhandled case.", underlyingError: nil))
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self)
    }
}

public struct ModalSubmitData: Codable {
    public var custom_id: String
    public var components: [ComponentInteractionResponse]
    public var resolved: ResolvedData?
}
