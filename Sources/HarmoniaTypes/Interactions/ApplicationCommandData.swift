//
//  ApplicationCommandData.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public struct ApplicationCommandInteractionDataOption: Codable {
    public enum Value: Codable {
        case string(String)
        case integer(Int)
        case double(Double)
        case boolean(Bool)
        
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            if let string = try? container.decode(String.self) {
                self = .string(string)
            } else if let int = try? container.decode(Int.self) {
                self = .integer(int)
            } else if let double = try? container.decode(Double.self) {
                self = .double(double)
            } else if let bool = try? container.decode(Bool.self) {
                self = .boolean(bool)
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
            case .boolean(let bool):
                try container.encode(bool)
            }
        }
    }
    
    public var name: String
    public var type: ApplicationCommandOptionType
    public var value: Value?
    public var options: [ApplicationCommandInteractionDataOption]?
    public var focused: Bool?
}

public struct ApplicationCommandData: Codable {
    public var id: Snowflake
    public var name: String
    public var type: ApplicationCommandType
    public var data: ResolvedData?
    public var options: [ApplicationCommandInteractionDataOption]?
    public var guild_id: Snowflake
    public var target_id: Snowflake
}
