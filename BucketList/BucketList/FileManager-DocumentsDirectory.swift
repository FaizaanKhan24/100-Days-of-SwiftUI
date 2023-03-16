//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Faizaan Khan on 3/16/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
