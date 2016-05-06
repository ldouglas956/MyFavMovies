//
//  ExistingMovieVC.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import CoreData

class ExistingMovieVC: UIViewController {

	@IBOutlet weak var movieTitle: UITextField!
	@IBOutlet weak var movieLink: UITextField!
	@IBOutlet weak var movieReview: UITextView!
	@IBOutlet weak var movieImage: UIImageView!
	@IBOutlet weak var movieRating: UITextField!
	
	// CORE DATA VARIABLES
//	@NSManaged var title: String?
//	@NSManaged var image: NSData?
//	@NSManaged var review: String?
//	@NSManaged var link: String?
//	@NSManaged var rating: String?
	
    var movies = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(movies[0].title)
	}
	
	
	// NEED A FUNCTION TO ASSIGN VALUES FROM CORE DATA HERE
	
	
	@IBAction func backPressed() {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}
