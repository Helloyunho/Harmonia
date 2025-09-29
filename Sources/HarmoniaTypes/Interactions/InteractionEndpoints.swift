//
//  InteractionEndpoints.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/30.
//

import Foundation

public extension Endpoints {
    func createInteractionResponse(_ id: Snowflake, _ token: String, withResp: Bool) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "interactions", "\(id)", token, "callback")
            .appending(queryItems: withResp ? [URLQueryItem(name: "with_response", value: "true")] : [])
    }
    
    func getOriginalInteractionResponse(_ id: Snowflake, _ token: String) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "@original")
    }
    
    func editOriginalInteractionResponse(_ id: Snowflake, _ token: String) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "@original")
    }
    
    func deleteOriginalInteractionResponse(_ id: Snowflake, _ token: String) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "@original")
    }
    
    func createFollowupMessage(_ id: Snowflake, _ token: String) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token)
    }
    
    func getFollowupMessage(_ id: Snowflake, _ token: String, _ messageID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "\(messageID)")
    }
    
    func editFollowupMessage(_ id: Snowflake, _ token: String, _ messageID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "\(messageID)")
    }
    
    func deleteFollowupMessage(_ id: Snowflake, _ token: String, _ messageID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL
            .appending(components: "webhooks", "\(id)", token, "messages", "\(messageID)")
    }
}
