//
//  AddMovieVC.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import CoreData

class AddMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	@IBOutlet weak var movieTitle: UITextField!
	@IBOutlet weak var movieLink: UITextField!
	@IBOutlet weak var movieReview: UITextView!
	@IBOutlet weak var movieImage: UIImageView!
	@IBOutlet weak var movieRating: UITextField!
	
	var imagePicker: UIImagePickerController! = UIImagePickerController()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		movieImage.clipsToBounds = true
    }
	
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
		imagePicker.dismissViewControllerAnimated(true, completion: nil)
		movieImage.image = image
	}
	
	
	@IBAction func backPressed() {
		dismissViewControllerAnimated(true, completion: nil)
	}

	
	@IBAction func addImage(sender: UIButton!) {
		presentViewController(imagePicker, animated: true, completion: nil)
	}
	
	
	@IBAction func addMovieToList(sender: UIButton!) {
		if let img = movieImage.image, let title = movieTitle.text where title != "" {
			let app = UIApplication.sharedApplication().delegate as! AppDelegate
			let context = app.managedObjectContext
			let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)! // Entity from xcdatamodel
			let movie = Movies(entity: entity, insertIntoManagedObjectContext: context)
			movie.title = title
			movie.link = movieLink.text
			movie.review = movieReview.text
			movie.rating = movieRating.text
			movie.setImg(img)
			
			context.insertObject(movie)
			do {
				try context.save()
			} catch {
				fatalError("Failure to save context: \(error)")
			}
			self.dismissViewControllerAnimated(true, completion: nil) // For use only if presented modally!
		}
	}
	
}
