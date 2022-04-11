//
//  Feature.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/11.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
