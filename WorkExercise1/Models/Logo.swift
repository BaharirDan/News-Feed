//
//  Logo.swift
//  WorkExercise1
//
//  Created by dan baharir on 01/11/2017.
//

import Foundation

class Logo: NSObject {
    
    struct LogoData {
        var small:URL!
        var medium:URL!
        var large:URL!
    }
    var logoData:LogoData!
    
    override init () {
        
        // init object params and set to non nil values.
        logoData = LogoData()
        print(logoData)
        logoData.small = URL.init(string: "")
        logoData.medium = URL.init(string: "")
        logoData.large = URL.init(string: "")
    }
    
    convenience init?(_ dictionary: Dictionary<String, AnyObject>) {
        self.init()
        
        // parse source dictionsry object to model objects.
        if let small = dictionary["small"] as? String {
            self.logoData.small = URL.init(string: small)
        }
        if let medium = dictionary["medium"] as? String {
            self.logoData.medium = URL.init(string: medium)
        }
        if let large = dictionary["large"] as? String {
            self.logoData.large = URL.init(string: large)
        }
    }
}
