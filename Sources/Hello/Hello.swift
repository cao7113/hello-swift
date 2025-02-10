import ArgumentParser

@main
struct Hello: ParsableCommand {
  @Option(help: "Specify the input")
  public var input: String = "Hi Swift"

  public func run() throws {
    print("\(self.input)!")
  }
}
