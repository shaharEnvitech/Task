//
//  Response.swift
//  Envitech
//
//  Created by intellithings on 24/11/2022.
//

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let monitorType: [MonitorType]
    let legends: [Legend]
    let monitor: [Monitor]

    enum CodingKeys: String, CodingKey {
        case monitorType = "MonitorType"
        case legends = "Legends"
        case monitor = "Monitor"
    }
}

// MARK: - Legend
struct Legend: Codable {
    let id: Int
    let tags: [Tag]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case tags
    }
}

// MARK: - Tag
struct Tag: Codable {
    let label, color: String

    enum CodingKeys: String, CodingKey {
        case label = "Label"
        case color = "Color"
    }
}

// MARK: - Monitor
struct Monitor: Codable {
    let id: Int
    let name, desc: String
    let monitorTypeID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case desc = "Desc"
        case monitorTypeID = "MonitorTypeId"
    }
}

// MARK: - MonitorType
struct MonitorType: Codable {
    let id: Int
    let name: String
    let legendID: Int
    let monitorTypeDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case legendID = "LegendId"
        case monitorTypeDescription = "description"
    }
}
