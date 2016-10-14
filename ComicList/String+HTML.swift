//
//  String+HTML.swift
//  ComicList
//
//  Created by Alejandro on 14/10/16.
//  Copyright © 2016 Alejandro Fuster. All rights reserved.
//

import Foundation
import UIKit

extension String {
    private var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        do {
            return try NSAttributedString(data: data,
                                          options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var plainText: String {
        return htmlToAttributedString?.string ?? ""
    }
}
