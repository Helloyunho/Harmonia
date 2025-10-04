//
//  ApplicationEndpoints.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public extension Endpoints {
    func getCurrentApplication() -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "@me")
    }
    
    func editCurrentApplication() -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "@me")
    }
    
    func getApplicationActivityInstance(_ applicationID: Snowflake, _ instanceID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(applicationID)", "activity-instances", "\(instanceID)")
    }
}
