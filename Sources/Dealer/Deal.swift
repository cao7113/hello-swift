import ArgumentParser
import Foundation

// import DeckOfPlayingCards
// import PlayingCard

#if os(Linux)
    import Glibc
#endif

@main
struct Deal: ParsableCommand {
    enum Error: Swift.Error, CustomStringConvertible {
        case notEnoughCards

        var description: String {
            switch self {
            case .notEnoughCards:
                return "Not enough cards"
            }
        }
    }

    // Swift 5.5 及之后的版本引入了并发安全检查，如果一个全局变量（或 static 变量）是可变的，Swift 需要确保它是线程安全的。
    // static var configuration = CommandConfiguration(
    static let configuration = CommandConfiguration(
        abstract: "Shuffles a deck of playing cards and deals a number of cards.",
        discussion: """
            For each count argument, prints a line of tab-delimited cards to stdout,
            or if there aren't enough cards remaining,
            prints "Not enough cards" to stderr and exits with a nonzero status.
            """)

    @Argument(
        help: .init(
            "The number of cards to deal at a time.",
            valueName: "count"))
    var counts: [UInt]

    mutating func run() throws {
        #if os(Linux)
            srandom(UInt32(clock()))
        #endif

        var deck = Deck.standard52CardDeck()
        deck.shuffle()

        for count in counts {
            var cards: [PlayingCard] = []

            for _ in 0..<count {
                guard let card = deck.deal() else {
                    Self.exit(withError: Error.notEnoughCards)
                }

                cards.append(card)
            }

            print(cards.map(\.description).joined(separator: "\t"))
        }
    }
}
