//
//  Photo.swift
//  Photo-Library
//
//  Created by Faizaan Khan on 3/22/23.
//

import Foundation
import SwiftUI

struct Photo : Codable, Identifiable, Comparable {
    var id: UUID
    var name: String
//    var image : Image?
    
    static func < (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.name < rhs.name
    }
}
