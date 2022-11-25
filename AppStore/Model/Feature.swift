//
//  Feature.swift
//  AppStore
//
//  Created by Walter J on 2022/11/24.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
