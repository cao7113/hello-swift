import Dealer
import Testing

struct RankTests {
  @Test func rank() {
    let rank = Rank.ace
    #expect(rank == .ace)
    #expect(rank.rawValue == 14)
    #expect(Rank.allCases.count == 13)
  }

  @Test func compare() {
    let two = Rank.two
    let three = Rank.three
    #expect(two < three)
    #expect(two == Rank.two)
  }

  @Test func asString() {
    let rank = Rank.ace
    #expect(String(describing: rank) == "A")
  }
}
