//
//  Shelf.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import Foundation

class Shelf: Hashable {
    
    var id = UUID()
    var person: Person
    var time: Date
    var alcohols: [Alcohol]
    
    init(person: Person, time: Date, alcohols: [Alcohol]) {
        self.person = person
        self.time = time
        self.alcohols = alcohols
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Shelf, rhs: Shelf) -> Bool {
        lhs.id == rhs.id
    }    
}

