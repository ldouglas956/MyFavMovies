//
//  Movies.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movies: NSManagedObject {

	func setImg(img: UIImage) {
		self.image = UIImagePNGRepresentation(img)
	}
	
	func getImg() -> UIImage {
		return UIImage(data: self.image!)!
	}

}
