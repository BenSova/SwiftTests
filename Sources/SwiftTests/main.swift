#!/usr/bin/swift

import Foundation

public protocol Emoji: CustomStringConvertible {
    var emoji: String { get }
}

public extension Emoji {
    var description: String {
        return emoji
    }
}

public extension Emoji {
    static var hand: EmojiHand {
        return .init()
    }
}

public struct EmojiHand: Emoji {
    private let token: EmojiSkinTones
    
    public var emoji: String {
        switch token {
        case .yellow:
            return "👋"
        case .white:
            return "👋🏻"
        case .light:
            return "👋🏼"
        case .medium:
            return "👋🏽"
        case .dark:
            return "👋🏾"
        case .black:
            return "👋🏿"
        }
    }
    public init(_ tone: EmojiSkinTones = .yellow) {
        self.token = tone
    }
}

public extension EmojiHand {
    var yellow: EmojiHand { .init(.yellow) }
    var white: EmojiHand { .init(.white) }
    var medium: EmojiHand { .init(.medium) }
    var black: EmojiHand { .init(.black) }
}

public enum EmojiSkinTones {
    case yellow
    case white
    case light
    case medium
    case dark
    case black
}


print("Hello World!")
print("Who are you? ", terminator: "")
var name = readLine()!
if name.hasPrefix("I am ") { name.removeFirst(5) }
if name.hasPrefix("I'm ") { name.removeFirst(4) }
if name.hasPrefix("My name is ") { name.removeFirst(11S) }
print("Hi \((name.isEmpty) ? ("Unknown") : (name))! \(EmojiHand())")
print("And the test results are... ", terminator: "")
_ = readLine()
var generator = SystemRandomNumberGenerator()
let result = generator.next()
print(result)
