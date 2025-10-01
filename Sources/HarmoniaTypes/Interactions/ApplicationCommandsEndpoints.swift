//
//  ApplicationCommandsEndpoints.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/2.
//

import Foundation

extension Endpoints {
    func getGlobalApplicationCommands(_ id: Snowflake, with_localizations: Bool = false) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(id)", "commands")
            .appending(queryItems: with_localizations ? [.init(name: "with_localizations", value: "\(with_localizations)")] : [])
    }
    
    func createGlobalApplicationCommands(_ id: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(id)", "commands")
    }
    
    func getGlobalApplicationCommand(_ appID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "commands", "\(commandID)")
    }
    
    func editGlobalApplicationCommands(_ appID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "commands", "\(commandID)")
    }
    
    func deleteGlobalApplicationCommands(_ appID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "commands", "\(commandID)")
    }
    
    func bulkOverwriteGlobalApplicationCommands(_ id: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(id)", "commands")
    }
    
    func getGuildApplicationCommands(_ appID: Snowflake, _ guildID: Snowflake, with_localizations: Bool = false) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands")
            .appending(queryItems: with_localizations ? [.init(name: "with_localizations", value: "\(with_localizations)")] : [])
    }
    
    func createGuildApplicationCommands(_ appID: Snowflake, _ guildID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands")
    }
    
    func getGuildApplicationCommand(_ appID: Snowflake, _ guildID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "\(commandID)")
    }
    
    func editGuildApplicationCommands(_ appID: Snowflake, _ guildID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "\(commandID)")
    }
    
    func deleteGuildApplicationCommands(_ appID: Snowflake, _ guildID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "\(commandID)")
    }
    
    func bulkOverwriteGuildApplicationCommands(_ appID: Snowflake, _ guildID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands")
    }
    
    func getGuildApplicationCommandPermissions(_ appID: Snowflake, _ guildID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "permissions")
    }
    
    func getApplicationCommandPermissions(_ appID: Snowflake, _ guildID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "\(commandID)", "permissions")
    }
    
    func editApplicationCommandPermissions(_ appID: Snowflake, _ guildID: Snowflake, _ commandID: Snowflake) -> URL {
        Endpoints.DISCORD_API_URL.appending(components: "applications", "\(appID)", "guilds", "\(guildID)", "commands", "\(commandID)", "permissions")
    }
}
