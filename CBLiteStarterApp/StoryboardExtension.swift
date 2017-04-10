//
//  StoryboardExtension.swift
//  CBLiteStarterApp
//
//  Created by Priya Rajagopal on 4/6/17.
//  Copyright © 2017 Couchbase Inc. All rights reserved.
//

import UIKit
extension UIStoryboard {
    enum Storyboard:String {
        case Main = "Main"
        
    }
    
    enum StoryboardSegue {
        case listDocs
        case addDoc
     
        
        var identifier:String {
            switch self {
            case .listDocs:
                return "ListDocumentSegue"
            case .addDoc:
                return "AddDocumentSegue"
                
                
            }
        }
        
        
    }
    
    class func getStoryboard(_ storyboard:Storyboard,bundle:Bundle? = nil )->UIStoryboard {
        return UIStoryboard(name:storyboard.rawValue, bundle: bundle)
    }
    
    func instantiateViewController<T:UIViewController>()->T where T:StoryboardIdentifiable {
        let vc =  self.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        if let viewController = vc as? T {
            return viewController
        }
        fatalError("Check identifier of viewcontroller in storyboard")
        
    }
    
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier:String {get}
}

extension StoryboardIdentifiable where Self:UIViewController {
    static var storyboardIdentifier:String {
        return String(describing: self)
    }
}


extension UIViewController:StoryboardIdentifiable {
    
}

