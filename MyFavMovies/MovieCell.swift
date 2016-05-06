//
//  MovieCell.swift
//  MyFavMovies
//
//  Created by Lance Douglas on 5/5/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
	
	
	@IBOutlet weak var movieTitle: UILabel!
	@IBOutlet weak var movieDesc: UILabel!
	@IBOutlet weak var movieImg: UIImageView!
	@IBOutlet weak var imdbBtn: UIButton!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	
	func configureCell(movie: Movies) {
		movieTitle.text = movie.title
		movieDesc.text = movie.review
		movieImg.image = movie.getImg()
	}
	
	
}
