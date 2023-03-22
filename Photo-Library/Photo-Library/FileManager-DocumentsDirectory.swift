//
//  FileManager-DocumentsDirectory.swift
//  Photo-Library
//
//  Created by Faizaan Khan on 3/22/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
