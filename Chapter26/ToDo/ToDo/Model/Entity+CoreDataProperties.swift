//
//  Entity+CoreDataProperties.swift
//  ToDo
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var todoItem: String
    @NSManaged public var isCompleted: Bool

}

extension Entity : Identifiable {

}
