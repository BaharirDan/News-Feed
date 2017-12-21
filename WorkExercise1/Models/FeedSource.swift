//
//  FeedSource.swift
//  WorkExercise1
//
//  Created by dan baharir on 01/11/2017.
//

/*
 Article is a news article model object that supports the Json model specification as documented at NewsAPI web site.
 To initialize object use convenience init(Dictionary).
 For this example - object is implemented with a struct to hold the object data values, I used a struct as this data should be read only and structs are passed by values thus securing data intergrity.
 In remarks I have left another option of implementation using private variables with custom getters and setters instead of using a struct (this way we can control accessability and read/write previlieges for the object data params).
 */

import Foundation

class FeedSource: NSObject {
    
    struct SourceData {
        var id:String!
        var name:String!
        var description:String!
        var category:String!
        var country:String!
        var language:String!
        var url:URL!
        var urlsToLogos:Logo!
    }
    var sourceData:SourceData!
    
    override init () {
        
        // init object params and set to non nil values.
        sourceData = SourceData()
        print(sourceData)
        sourceData.id = ""
        sourceData.name = ""
        sourceData.category = ""
        sourceData.country = ""
        sourceData.language = ""
        sourceData.description = ""
        sourceData.urlsToLogos = Logo()
        sourceData.url = URL.init(string: "")
    }
    
    convenience init?(_ dictionary: Dictionary<String, AnyObject>) {
        self.init()
        
        // parse source dictionsry object to model objects.
        // source object without an 'id' value will not be initialized and method will return nil.
        if let id = dictionary["id"] as? String {
            self.sourceData.id = id
            if let name = dictionary["name"] as? String {
                self.sourceData.name = name
            }
            if let description = dictionary["description"] as? String {
                self.sourceData.description = description
            }
            if let country = dictionary["country"] as? String {
                self.sourceData.country = country
            }
            if let category = dictionary["category"] as? String {
                self.sourceData.category = category
            }
            if let language = dictionary["language"] as? String {
                self.sourceData.language = language
            }
            if let url = dictionary["url"] as? String {
                self.sourceData.url = URL.init(string: url)
            }
            if let urlsToLogos = dictionary["urlsToLogos"] as? [String:AnyObject] {
                self.sourceData.urlsToLogos = Logo.init(urlsToLogos)
            }
        }else {
            return nil
        }
    }
}
