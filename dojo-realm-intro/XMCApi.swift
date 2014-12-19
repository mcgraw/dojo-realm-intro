//
//  XMCApi.swift
//  dojo-realm-intro
//
//  Created by David McGraw on 12/17/14.
//  Copyright (c) 2014 David McGraw. All rights reserved.
//

import Realm

class XMCApi {
    
    class func requestOpeningMovies() {
        let movies = [ XMCMovie(id: "0", title: "The Hobbit: The Battle Of The Five Armies", tomatometer: 62, consensus: "Suitably grim, epic, and action-packed, The Hobbit: The Battle of the Five Armies ends Peter Jackson's second Middle-earth trilogy on a rousing high note.", imageName: "hobbit"),
                 XMCMovie(id: "1", title: "Night At The Museum: Secret Of The Tomb", tomatometer: 53, consensus: "No consensus yet.", imageName: "museum"),
                 XMCMovie(id: "2", title: "Annie", tomatometer: 20, consensus: "The new-look Annie hints at a progressive take on a well-worn story, but smothers its likable cast under clichés, cloying cuteness, and a distasteful materialism.", imageName: "annie"),
                 XMCMovie(id: "3", title: "Mr. Turner", tomatometer: 97, consensus: "Led by a masterful performance from Timothy Spall and brilliantly directed by Mike Leigh, Mr. Turner is a superior Hollywood biopic.", imageName: "turner"),
                 XMCMovie(id: "4", title: "Song Of The Sea", tomatometer: 100, consensus: "No consensus yet.", imageName: "sea") ]
        
        // Write our movie objects to the database
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        
        for movie in movies {
            /*  This method will avoid duplicating records by looking at the
                primary key we've set on our object. Go look at the XMCMovie
                class to see that method defined.
            */
            XMCMovie.createOrUpdateInDefaultRealmWithObject(movie)
            
            // Alternatively, you could add new objects by calling this method
            // realm.addObject(movie)
            // or
            // realm.addObjects(movies) // An array of objects
        }
        
        realm.commitWriteTransaction()
    }
}
