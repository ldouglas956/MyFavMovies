//
//  ViewController.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

	// MARK: VARIABLES
	
	@IBOutlet weak var movieTable: UITableView!
	
	var movies = [Movies]()
	
	
	// MARK: FUNCTIONS
	
	override func viewDidLoad() {
		super.viewDidLoad()
		movieTable.delegate = self
		movieTable.dataSource = self
	}
	
	override func viewDidAppear(animated: Bool) {
		fetchAndSetResults()
		movieTable.reloadData()
	}
	
	
	func fetchAndSetResults() {
		let app = UIApplication.sharedApplication().delegate as! AppDelegate
		let context = app.managedObjectContext
		let fetchRequest = NSFetchRequest(entityName: "Movies")  // Entity from xcdatamodel
		
		do {
			let results = try context.executeFetchRequest(fetchRequest)
			self.movies = results as! [Movies]
		} catch let err as NSError {
			print(err.debugDescription)
		}
	}
	
	
	// MARK: BOILERPLATE TABLEVIEW CODE
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {  // identifier assigned to cell
			let movie = movies[indexPath.row]
			cell.configureCell(movie)
			return cell
		} else {
			return MovieCell()
		}
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return movies.count
	}
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "ExistingMovie" {
                if let destination = segue.destinationViewController as? ExistingMovieVC, selectedIndex = movieTable.indexPathForCell(sender as! UITableViewCell) {
                    destination.movies = [movies[selectedIndex.row]]
                }
            }
        }
    }
}

