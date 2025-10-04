//
//  Scopes.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public enum Scopes: String, Codable {
    case activitiesRead = "activities.read"
    case activitiesWrite = "activities.write"
    case applicationsBuildsRead = "applications.builds.read"
    case applicationsBuildsUpload = "applications.builds.upload"
    case applicationsCommands = "applications.commands"
    case applicationsCommandsUpdate = "applications.commands.update"
    case applicationsCommandsPermissionsUpdate = "applications.commands.permissions.update"
    case applicationsEntitlements = "applications.entitlements"
    case applicationsStoreUpdate = "applications.store.update"
    case bot
    case connections
    case dm_channelsRead = "dm_channels.read"
    case email
    case gdmJoin = "gdm.join"
    case guilds
    case guildsJoin = "guilds.join"
    case guildsMembersRead = "guilds.members.read"
    case identify
    case messagesRead = "messages.read"
    case relationshipsRead = "relationships.read"
    case role_connectionsWrite = "role_connections.write"
    case rpc
    case rpcActivitiesWrite = "rpc.activities.write"
    case rpcNotificationsRead = "rpc.notifications.read"
    case rpcVoiceRead = "rpc.voice.read"
    case rpcVoiceWrite = "rpc.voice.write"
    case voice
    case webhookIncoming = "webhook.incoming"
}
