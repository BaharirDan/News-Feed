//
//  Article.swift
//  WorkExercise1
//
//  Created by dan baharir on 31/10/2017.
//

/*
 Article is a news article model object that supports the Json model specification as documented at NewsAPI web site.
 To initialize object use convenience init(Dictionary).
 For this example - object is implemented with a struct to hold the object data values, I used a struct as this data should be read only and structs are passed by values thus securing data intergrity.
 In remarks I have left another option of implementation using private variables with custom getters and setters instead of using a struct (this way we can control accessability and read/write previlieges for the object data params).
 */

import Foundation

class Article: NSObject {
    
    struct ArticleData {
        var author:String!
        var title:String!
        var description:String!
        var url:URL!
        var urlToImage:URL!
        var publishedAt:Date!
    }
    var articleData:ArticleData!
    
//    private var _author:String!
//    private var _title:String!
//    private var _description:String!
//    private var _url:URL!
//    private var _urlToImage:URL!
//    private var _publishedAt:Date!
    
    // Setting read only access to model data.
//    var author:String {
//        get {
//            return self._author != nil ? self._author : ""
//        } set {}
//    }
//    var title:String {
//        get {
//            return self._title != nil ? self._title : ""
//        } set {}
//    }
//    var descriptions:String {
//        get {
//            return self._description != nil ? self._description : ""
//        } set {}
//    }
//    var url:URL {
//        get {
//            return self._url
//        } set {}
//    }
//    var urlToImage:URL {
//        get {
//            return self._urlToImage
//        } set {}
//    }
//    var publishedAt:Date {
//        get {
//            return self._publishedAt != nil ? self._publishedAt : Date()
//        } set {}
//    }
    
    override init () {
        
        // init object params and set to non nil values.
        articleData = ArticleData()
        print(articleData)
        articleData.title = ""
        articleData.description = ""
        articleData.author = ""
        articleData.publishedAt = Date()
        articleData.urlToImage = URL.init(string: "")
        articleData.url = URL.init(string: "")
    }
    
    convenience init?(_ dictionary: Dictionary<String, AnyObject>) {
        self.init()
        
        // parse article dictionsry object to model objects.
        // article object without a 'title' value will not be initialized and method will return nil.
        if let title = dictionary["title"] as? String {
            //_title = title
            self.articleData.title = title
            
            if let author = dictionary["author"] as? String {
               // self._author = author
                self.articleData.author = author
            }
            if let url = dictionary["url"] as? String {
                //_url = URL.init(string: url)
                self.articleData.url = URL.init(string: url)
            }
            if let urlToImage = dictionary["urlToImage"] as? String {
                //_urlToImage = URL.init(string: urlToImage)
                self.articleData.urlToImage = URL.init(string: urlToImage)
            }
            if let description = dictionary["description"] as? String {
                //_description = description
                self.articleData.description = description
            }
            if let publishedAt = dictionary["publishedAt"] as? String {
                if let published = DateHepler.stringToDateFormat(date: publishedAt) {
                    //_publishedAt = published
                    self.articleData.publishedAt = published
                }
            }
        }else {
            return nil
        }
    }
}
