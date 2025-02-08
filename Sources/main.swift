// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser

@main
struct Swifter: ParsableCommand {
  @Option(help: "Specify the input")
  public var input: String = "Hi Swift!"

  public func run() throws {
    print("\(self.input) as Swifter")
  }
}
