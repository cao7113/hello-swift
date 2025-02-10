import Dealer
import Testing

struct SuitTests {
  @Test func suit() {
    let suits = Suit.allCases
    #expect(suits.count == 4)

    // print(Suit.hearts)
  }
}
