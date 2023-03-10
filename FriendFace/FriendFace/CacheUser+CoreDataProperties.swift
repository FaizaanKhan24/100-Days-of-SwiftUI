//
//  CacheUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/9/23.
//
//

import Foundation
import CoreData


extension CacheUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheUser> {
        return NSFetchRequest<CacheUser>(entityName: "CacheUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friend: NSSet?

    public var wrappedName : String {
        name ?? "Unknown Name"
    }
    
    public var wrappedCompany : String {
        company ?? "Unknown Company"
    }
    
    public var wrappedEmail : String {
        email ?? "Unknown Email"
    }
    
    public var wrappedAddress : String {
        address ?? "Unknown Address"
    }
    
    public var wrappedAbout : String {
        about ?? "Unknown About"
    }
    
    public var wrappedRegistered : Date {
        registered ?? Date()
    }
    
    public var wrappedTags : String {
        tags ?? "N/A"
    }
    
    public var wrappedFriends : [CacheFriend] {
        let set = friend as? Set<CacheFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for friend
extension CacheUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CacheFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CacheFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CacheUser : Identifiable {

}
