//
// Info.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Info: Codable {

    public var count: Int?
    public var pages: Int?
    public var next: String?
    public var prev: String?

    public init(count: Int?, pages: Int?, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }


}
