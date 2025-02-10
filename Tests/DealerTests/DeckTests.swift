import Dealer
import Testing

struct DeckTests {
  @Test func stdDeck() {
    var deck = Deck.standard52CardDeck()
    deck.shuffle()
    #expect(deck.count == 52)
  }
}
