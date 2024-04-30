//
//  Post.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
struct Post: Identifiable, Decodable,Equatable {
    let id: Int
    let title: String
    let userId:Int
    let body:String
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}

