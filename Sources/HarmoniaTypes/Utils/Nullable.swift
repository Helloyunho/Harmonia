//
//  Nullable.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//


import Foundation

public enum Nullable<T>: ExpressibleByNilLiteral {

    public init(_ some: T) {
        self = .some(some)
    }
    
    public init(nilLiteral: ()) {
        self = .none
    }
    
    case some(T)
    case none
    
    @inlinable public func map<U>(_ transform: (T) throws -> U) rethrows -> U? {
        switch self {
        case .some(let some):
                return .some(
                try transform(some)
            )
        case .none:
            return .none
        }
    }
    
    @inlinable public func map<U>(_ transform: (T) throws -> U?) rethrows -> U? {
        switch self {
        case .some(let some):
                return try transform(some)
        case .none:
            return .none
        }
    }
}


extension Nullable: Equatable where T: Equatable {
    public static func == (lhs: Nullable<T>, rhs: Nullable<T>) -> Bool {
        switch (lhs, rhs) {
        case let (.some(l), .some(r)):
            return l == r
        case (.none, .none):
            return true
        default:
            return false
        }
    }
}

extension Nullable: Hashable where T: Hashable {
    @inlinable public func hash(into hasher: inout Hasher) {
        switch self {
        case .none:
            hasher.combine(0 as UInt8)
        case .some(let some):
            hasher.combine(1 as UInt8)
            hasher.combine(some)
        }
    }
}

extension Nullable: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .none
        } else {
            self = .some(try container.decode(T.self))
        }
    }
}

extension Nullable: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .some(let t):
            try container.encode(t)
        case .none:
            try container.encodeNil()
        }
    }
}

public func ?? <T>(nullable: Nullable<T>, defaultValue: @autoclosure () throws -> T) rethrows -> T {
    switch nullable {
    case .some(let some):
        return some
    case .none:
        return try defaultValue()
    }
}

public func ?? <T>(nullable: Nullable<T>, defaultValue: @autoclosure () throws -> Nullable<T>) rethrows -> Nullable<T> {
    switch nullable {
    case .some(let some):
        return .some(some)
    case .none:
        return try defaultValue()
    }
}

infix operator ?=
func ?=<T>(lhs: inout T?, rhs: Nullable<T>) -> Bool {
    if case let .some(s) = rhs {
        lhs = s
        return true
    } else {
        lhs = nil
        return false
    }
}
