//
//  Alcohol.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import UIKit

class Alcohol: Hashable {
    
    var id = UUID()
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        self.title = title
        self.image = image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Alcohol, rhs: Alcohol) -> Bool {
        lhs.id == rhs.id
    }
}
