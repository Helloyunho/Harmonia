//
//  ApplicationRoleConnectionMetadata.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public enum ApplicationRoleConnectionMetadataType: Int, Codable {
    case INTEGER_LESS_THAN_OR_EQUAL = 1, INTEGER_GREATER_THAN_OR_EQUAL,
         INTEGER_EQUAL, INTEGER_NOT_EQUAL, DATETIME_LESS_THAN_OR_EQUAL,
         DATETIME_GREATER_THAN_OR_EQUAL, BOOLEAN_EQUAL, BOOLEAN_NOT_EQUAL
}

public struct ApplicationRoleConnectionMetadata: Codable {
    public var type: ApplicationRoleConnectionMetadataType
    public var key: String
    public var name: String
    public var name_localizations: [Locales: String?]?
    public var description: String
    public var description_localizations: [Locales: String?]?
}

// it's pretty short so might as well just
// add endpoints in here

public extension Endpoints {
    func getApplicationRoleConnectionMetadataRecords(_ id: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(id)", "role-connections", "metadata")
    }
    
    func updateApplicationRoleConnectionMetadataRecords(_ id: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(id)", "role-connections", "metadata")
    }
}
