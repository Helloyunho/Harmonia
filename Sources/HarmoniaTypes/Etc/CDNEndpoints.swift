//
//  CDNEndpoints.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/2.
//

import Foundation

extension Endpoints {
    public static let DISCORD_CDN_URL = URL(string: "https://cdn.discordapp.com/")!
    
    public enum Extensions: String {
        case png = "png"
        case jpeg = "jpeg"
        case webp = "webp"
        case gif = "gif"
        case avif = "avif"
        case lottie = "json"
    }
    
    func customEmoji(_ emojiID: Snowflake, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "emojis", "\(emojiID).\(ext.rawValue)")
    }
    
    func guildIcon(_ guildID: Snowflake, _ guildIcon: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "icons", "\(guildID)", "\(guildIcon).\(ext.rawValue)")
    }
    
    func guildSplashIcon(_ guildID: Snowflake, _ guildSplash: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "splashes", "\(guildID)", "\(guildSplash).\(ext.rawValue)")
    }

    func guildDiscoverySplashIcon(_ guildID: Snowflake, _ guildDiscoverySplash: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "discovery-splashes", "\(guildID)", "\(guildDiscoverySplash).\(ext.rawValue)")
    }

    func guildBannerIcon(_ guildID: Snowflake, _ guildBanenr: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "banners", "\(guildID)", "\(guildBanenr).\(ext.rawValue)")
    }

    func userBannerIcon(_ userID: Snowflake, _ userBanner: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "banners", "\(userID)", "\(userBanner).\(ext.rawValue)")
    }
    
    func defaultUserAvatar(_ userID: Snowflake) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "embed", "avatars", "\((userID.snowflake >> 22) % 6).png")
    }
    
    func userAvatar(_ userID: Snowflake, _ userAvatar: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "avatars", "\(userID)", "\(userAvatar).\(ext.rawValue)")
    }
    
    func guildMemberAvatar(_ guildID: Snowflake, _ userID: Snowflake, _ memberAvatar: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "guilds", "\(guildID)" , "users", "\(userID)", "avatars", "\(memberAvatar).\(ext.rawValue)")
    }
    
    func avatarDecoration(_ avatarDecorationDataAsset: String) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "avatar-decoration-presets", "\(avatarDecorationDataAsset).png")
    }
    
    func applicationIcon(_ applicationID: Snowflake, _ icon: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-icons", "\(applicationID)", "\(icon).\(ext.rawValue)")
    }
    
    func applicationCover(_ applicationID: Snowflake, _ coverImage: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-icons", "\(applicationID)", "\(coverImage).\(ext.rawValue)")
    }
    
    func applicationAsset(_ applicationID: Snowflake, _ assetID: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-assets", "\(applicationID)", "\(assetID).\(ext.rawValue)")
    }
    
    func achievementIcon(_ applicationID: Snowflake, _ achievementID: Snowflake, _ iconHash: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-assets", "\(applicationID)", "achievements", "\(achievementID)", "icons", "\(iconHash).\(ext.rawValue)")
    }
    
    func storePageAsset(_ applicationID: Snowflake, _ assetID: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-assets", "\(applicationID)", "store", "\(assetID).\(ext.rawValue)")
    }
    
    func stickerPackBanner(_ stickerPackBannerAssetID: Snowflake) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "app-assets", "710982414301790216", "store", "\(stickerPackBannerAssetID)")
    }
    
    func teamIcon(_ teamID: Snowflake, _ teamIcon: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "team-icons", "\(teamID)", "\(teamIcon).\(ext.rawValue)")
    }
    
    func sticker(_ stickerID: Snowflake, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "stickers", "\(stickerID).\(ext.rawValue)")
    }
    
    func roleIcon(_ roleID: Snowflake, _ roleIcon: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "role-icons", "\(roleID)", "\(roleIcon).\(ext.rawValue)")
    }
    
    func guildScheduledEventCover(_ scheduledEventID: Snowflake, _ scheduledEventCoverImage: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "guild-events", "\(scheduledEventID)", "\(scheduledEventCoverImage).\(ext.rawValue)")
    }
    
    func guildMemberBanner(_ guildID: Snowflake, _ userID: Snowflake, _ memberBanner: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "guilds", "\(guildID)", "users", "\(userID)", "banners", "\(memberBanner).\(ext.rawValue)")
    }
    
    func guildTagBadge(_ guildID: Snowflake, _ badgeHash: String, ext: Extensions = .png) -> URL {
        Endpoints.DISCORD_CDN_URL.appending(components: "guild-tag-badges", "\(guildID)", "\(badgeHash).\(ext.rawValue)")
    }
}
