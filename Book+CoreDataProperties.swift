//
//  Book+CoreDataProperties.swift
//  Assignment-3
//
//  Created by user278021 on 11/11/25.
//
//

public import Foundation
public import CoreData


public typealias BookCoreDataPropertiesSet = NSSet

extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var author: String?
    @NSManaged public var status: String?
    @NSManaged public var publisher: String?

}

extension Book : Identifiable {

}
