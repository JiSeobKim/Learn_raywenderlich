//
//  UserInfo+CoreDataProperties.swift
//  
//
//  Created by kimjiseob on 17/06/2019.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var name: String?
    @NSManaged public var nickName: String?
    @NSManaged public var age: Int16

}
