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
    }
    
    public var name: String
//    public var type: ApplicationCommandOptionType
    public var value: Value?
    public var options: [ApplicationCommandInteractionDataOption]?
    public var focused: Bool?
}

public struct ApplicationCommandData: Codable {
    public var id: Snowflake
    public var name: String
//    public var type: ApplicationCommandType
    public var data: ResolvedData?
    public var options: [ApplicationCommandInteractionDataOption]?
    public var guild_id: Snowflake
    public var target_id: Snowflake
}
