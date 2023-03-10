//
//  CacheFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/9/23.
//
//

import Foundation
import CoreData


extension CacheFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheFriend> {
        return NSFetchRequest<CacheFriend>(entityName: "CacheFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CacheUser?

    public var wrappedName : String {
        name ?? "Unknown Name"
    }
}

extension CacheFriend : Identifiable {

}
