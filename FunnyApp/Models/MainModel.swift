//
//  MainModel.swift
//  FunnyApp
//
//  Created by Максим Самороковский on 19.02.2024.
//

import Foundation

struct Welsome: Codable {
    let success: Bool
    let data: DataClass
}

struct DataClass: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let id, name: String
    let url: String
    let width, height, boxCount, captions: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
        case captions
    }
}


