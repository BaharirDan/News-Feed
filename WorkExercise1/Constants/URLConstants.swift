//
//  APPURL.swift
//  WorkExercise1
//
//  Created by dan baharir on 02/11/2017.
//

import Foundation

struct APPURL {
    private struct Domains {
        
        static let Dev = "https://newsapi.org"
        static let UAT = "http://"
        static let QA = "http://"
    }
    
    private struct Routes {
        
        static let NewsApiV1 = "/v1"
        static let NewsApiV2 = "/v2"
    }
    
    private static let Domain = Domains.Dev
    private static let Route = Routes.NewsApiV1
    private static let BaseURL = Domain + Route
    
    static var NewsSources : String {
        return BaseURL + "/sources?"
    }
    
    static var NewsArticles : String {
        return BaseURL + "/articles?"
    }
    

}
