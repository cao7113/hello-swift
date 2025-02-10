/// An enumeration that defines the suit of a playing card.
public enum Suit: String, CaseIterable {
    case spades, hearts, diamonds, clubs
    // case 黑桃 = "spades"   // 黑桃 ♠️
    // case 红桃 = "hearts"   // 红桃 ♥️
    // case 方片 = "diamonds" // 方片 ♦️
    // case 梅花 = "clubs"    // 梅花 ♣️
}

// MARK: - Comparable

/// An extension that allows comparisons between suits.
extension Suit: Comparable {
    public static func < (lhs: Suit, rhs: Suit) -> Bool {
        switch (lhs, rhs) {
        case (_, _) where lhs == rhs:
            return false
        case (.spades, _),
            (.hearts, .diamonds), (.hearts, .clubs),
            (.diamonds, .clubs):
            return false
        default:
            return true
        }
    }
}

// MARK: - CustomStringConvertible

/// An extension that provides a human-readable description of a suit.
extension Suit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .spades: return "♠︎"
        case .hearts: return "♡"
        case .diamonds: return "♢"
        case .clubs: return "♣︎"
        }
    }
}
