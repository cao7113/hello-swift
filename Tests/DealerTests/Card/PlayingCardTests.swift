import Dealer
import Testing

struct PlayingCardTests {
  @Test func suit() {
    let card = PlayingCard(rank: Rank.jack, suit: .hearts)
    #expect(String(describing: card) == "♡ J")
  }
}
