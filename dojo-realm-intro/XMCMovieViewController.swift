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

    // This query will grab all of our movies
    // var movies = XMCMovie.allObjects()
    // This query will only grab movies with ratings less than the provided amount
    var movies = XMCMovie.objectsWhere("tomatometer < 60")
    var index = UInt(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Easily see where the realm database is located so we can open it with the Realm Browser
        println(RLMRealm.defaultRealmPath())
        
        // Simulate grabbing data from a web service & creating XMCMovie objects
        XMCApi.requestOpeningMovies()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        layoutMovieObject(movies[index] as XMCMovie)
    }
    
    // MARK: Layout
    
    func layoutMovieObject(movie: XMCMovie) {
        moviePoster.image = UIImage(named: movie.imageName)
    
        movieTitle.text = movie.title
        
        movieDescription.text = movie.consensus
        
        movieRating.text = "\(movie.tomatometer)%"
    }

    // MARK: Actions
    
    @IBAction func nextActionPressed(sender: AnyObject) {
        if index < movies.count-1 {
            layoutMovieObject(movies[++index] as XMCMovie)
        }
    }
}

