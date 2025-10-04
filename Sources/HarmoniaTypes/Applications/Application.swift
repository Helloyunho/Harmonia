//
//  Application.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public struct Application: Codable {
    public var id: Snowflake
    public var name: String
    public var icon: Nullable<String>
    public var description: String
    public var rpc_origins: [String]?
    public var bot_public: Bool
    public var bot_require_code_grant: Bool
//    public var bot: PartialUser?
    public var terms_of_service_url: String?
    public var privacy_policy_url: String?
//    public var owner: PartialUser?
    public var verify_key: String
//    public var team: Nullable<Team>
    public var guild_id: Snowflake?
//    public var guild: PartialGuild?
    public var primary_sku_id: Snowflake?
    public var slug: String?
    public var cover_image: String?
    public var flags: ApplicationFlag?
    public var approximate_guild_count: Int?
    public var approximate_user_install_count: Int?
    public var approximate_user_authorization_count: Int?
    public var redirect_uris: [String]
    public var interactions_endpoint_url: Nullable<String?>
    public var role_connections_verification_url: Nullable<String?>
    public var event_webhooks_url: Nullable<String?>
    public var event_webhooks_status: ApplicationEventWebhookStatus
//    public var event_webhooks_types: [WebhookEventType]?
    public var tags: [String]?
    public var install_params: InstallParams
    public var integration_types_config: [ApplicationIntegrationType:ApplicationIntegrationTypeConfiguration]?
    public var custom_install_url: String?
}

public enum ApplicationIntegrationType: Int, Codable {
    case GUILD_INSTALL = 0, USER_INSTALL
}

public struct ApplicationIntegrationTypeConfiguration: Codable {
    public var oauth2_install_params: InstallParams?
}

public enum ApplicationEventWebhookStatus: Int, Codable {
    case DISABLED = 1, ENABLED, DISABLED_BY_DISCORD
}

public struct ApplicationFlag: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    nonisolated(unsafe) static let APPLICATION_AUTO_MODERATION_RULE_CREATE_BADGE = ApplicationFlag(rawValue: 1 << 6)
    nonisolated(unsafe) static let GATEWAY_PRESENCE = ApplicationFlag(rawValue: 1 << 12)
    nonisolated(unsafe) static let GATEWAY_PRESENCE_LIMITED = ApplicationFlag(rawValue: 1 << 13)
    nonisolated(unsafe) static let GATEWAY_GUILD_MEMBERS = ApplicationFlag(rawValue: 1 << 14)
    nonisolated(unsafe) static let GATEWAY_GUILD_MEMBERS_LIMITED = ApplicationFlag(rawValue: 1 << 15)
    nonisolated(unsafe) static let VERIFICATION_PENDING_GUILD_LIMIT = ApplicationFlag(rawValue: 1 << 16)
    nonisolated(unsafe) static let EMBEDDED = ApplicationFlag(rawValue: 1 << 17)
    nonisolated(unsafe) static let GATEWAY_MESSAGE_CONTENT = ApplicationFlag(rawValue: 1 << 18)
    nonisolated(unsafe) static let GATEWAY_MESSAGE_CONTENT_LIMITED = ApplicationFlag(rawValue: 1 << 19)
    nonisolated(unsafe) static let APPLICATION_COMMAND_BADGE = ApplicationFlag(rawValue: 1 << 23)
}

public struct InstallParams: Codable {
    public var scopes: [Scopes]
    public var permissions: Permissions
}

public struct EditCurrentApplicationRequest: Codable {
    public var custom_install_url: String
    public var description: String
    public var role_connections_verification_url: String
    public var install_params: InstallParams
    public var integration_types_config: [ApplicationIntegrationType:ApplicationIntegrationTypeConfiguration]
    public var flags: ApplicationFlag
    public var icon: Nullable<ImageData>
    public var cover_image: Nullable<ImageData>
    public var interactions_endpoint_url: String
    public var tags: [String]
    public var event_webhooks_url: String
    public var event_webhooks_status: ApplicationEventWebhookStatus
    public var event_webhooks_types: [String]
}
