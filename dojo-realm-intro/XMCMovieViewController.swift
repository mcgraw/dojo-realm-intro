//
//  XMCMovieViewController.swift
//  dojo-realm-intro
//
//  Created by David McGraw on 12/17/14.
//  Copyright (c) 2014 David McGraw. All rights reserved.
//

import UIKit
import Realm

class XMCMovieViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    var movies = [XMCMovie]()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Easily see where the realm database is located so we can open it with the Realm Browser
        println(RLMRealm.defaultRealm().path)
        
        // Simulate grabbing data from a web service & creating XMCMovie objects
        XMCApi.requestOpeningMovies()

        // This query will grab all of our movies
//        let allMovies = XMCMovie.allObjects()
        
        // This query will only grab movies with ratings less than the provided amount
        let allMovies = XMCMovie.objectsWhere("tomatometer < 60")
        
        // Loop through the results and add them to our movies array
        for index in 0...allMovies.count-1 {
            let movie = allMovies[index] as XMCMovie
            movies.append(movie)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.layoutMovieObject(self.movies[index])
    }
    
    // MARK: Layout
    
    func layoutMovieObject(movie: XMCMovie) {
        self.moviePoster.image = UIImage(named: movie.imageName)
    
        self.movieTitle.text = movie.title
        
        self.movieDescription.text = movie.consensus
        
        self.movieRating.text = "\(movie.tomatometer)%"
    }

    // MARK: Actions
    
    @IBAction func nextActionPressed(sender: AnyObject) {
        if index == movies.count-1 {
            index = -1
        }
        index += 1
        self.layoutMovieObject(self.movies[index])
    }
}

