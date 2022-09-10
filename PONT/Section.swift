//
//  Section.swift
//  PONT
//
//  Created by Maxim Butin on 10.09.2022.
//

import UIKit

class Section: Hashable {
    
    var id = UUID()
    var shelfs: [Shelf]
    
    init(shelfs: [Shelf]) {
        self.shelfs = shelfs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.id == rhs.id
    }
}

extension Section {
    
    static var allSections: [Shelf] = [
        Shelf(person: Person(name: "Максим",
                             sirname: "Бутин"),
              time: .now,
              alcohols: [
                Alcohol(title: "Budweizer", image: UIImage(named: "budweizer")),
                Alcohol(title: "Джин тоник", image: UIImage(named: "jin")),
                Alcohol(title: "Jack Daniels", image: UIImage(named: "whisky")),
                Alcohol(title: "Budweizer", image: UIImage(named: "budweizer")),
                Alcohol(title: "Джин тоник", image: UIImage(named: "jin")),
                Alcohol(title: "Jack Daniels", image: UIImage(named: "whisky")),
              ]
        ),
    ]
}



