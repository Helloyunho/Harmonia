//
//  Snowflake.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public struct Snowflake {
    public let snowflake: UInt64
    
    public var timestamp: Date {
        let timestamp = (snowflake >> 22) + 1420070400000
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
    
    public var workerID: UInt8 {
        return UInt8((snowflake & 0x3E0000) >> 17)
    }
    
    public var processID: UInt8 {
        return UInt8((snowflake & 0x1F000) >> 12)
    }
    
    public var increment: UInt16 {
        return UInt16(snowflake & 0xFFF)
    }
    
    public init(_ snowflake: UInt64) {
        self.snowflake = snowflake
    }
    
    public init(_ string: String) {
        self.snowflake = UInt64(string) ?? 0
    }
    
    public func toString() -> String {
        String(self.snowflake)
    }
}

extension Snowflake: Decodable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        self.init(string)
    }
}

extension Snowflake: Encodable {
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.toString())
    }
}

extension Snowflake: CustomStringConvertible {
    public var description: String {
        toString()
    }
}
