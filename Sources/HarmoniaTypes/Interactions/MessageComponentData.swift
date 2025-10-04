//
//  MessageComponentData.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public struct MessageComponentData: Codable {
    public var custom_id: String
    public var component_type: ComponentType
    public var values: [String]?
    public var resolved: ResolvedData?
}
