//
//  Activity.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/5.
//

import Foundation

public struct ActivityInstance: Codable {
    public var application_id: Snowflake
    public var instance_id: String
    public var launch_id: Snowflake
    public var location: ActivityLocation
    public var users: [Snowflake]
}

public enum ActivityLocationKind: String, Codable {
    case gc
    case pc
}

public struct ActivityLocation: Codable {
    public var id: String
    public var kind: ActivityLocationKind
    public var channel_id: Snowflake
    public var guild_id: Nullable<Snowflake?>
}
