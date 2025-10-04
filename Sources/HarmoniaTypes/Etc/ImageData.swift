//
//  ImageData.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/10/4.
//

import Foundation

public struct ImageData: Codable, CustomStringConvertible {
    public enum ImageType: String, Codable {
        case png = "image/png"
        case jpeg = "image/jpeg"
        case gif = "image/gif"
    }
    
    public var string: String
    
    public var description: String {
        return string
    }
    
    public var data: Data {
        Data(base64Encoded: String(string.split(separator: ",").last!))!
    }
    
    public var type: ImageType {
        ImageType(rawValue: String(string.split(separator: ";").first![5...]))!
    }
}
