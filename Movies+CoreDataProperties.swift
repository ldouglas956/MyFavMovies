//
//  Movies+CoreDataProperties.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var title: String?
    @NSManaged var image: NSData?
    @NSManaged var review: String?
    @NSManaged var link: String?
    @NSManaged var rating: String?

}
