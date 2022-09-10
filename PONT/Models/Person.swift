//
//  Person.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import UIKit

class Person: Hashable {
    
    var id = UUID()
    var name: String
    var sirname: String
    var avatar: UIImage?
    
    init(name: String, sirname: String, avatar: UIImage? = nil) {
        self.name = name
        self.sirname = sirname
        self.avatar = avatar
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}
