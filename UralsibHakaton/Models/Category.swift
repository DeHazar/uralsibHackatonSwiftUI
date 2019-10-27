//
//  Category.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle : String
    var answers: [Answer]
    var checked: Bool?
    
    func isChecked() -> Bool{
        if let ch = checked {
            return ch
        }
        return false
    }
}

struct Answer: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle : String
    var subanswers: [SubAnswer]
    var textbox: Bool
    var checkbox: Bool
    var isSelected: Bool?
    var isOpen: Bool?
    
    init(id:Int,title: String, subtitle: String , subanswers: [SubAnswer], textBox: Bool, checkbox: Bool, isSelected: Bool?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.subanswers = subanswers
        self.textbox = textBox
        self.checkbox = checkbox
        self.isSelected = isSelected
    }
}

struct SubAnswer: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle : String
    var textbox: Bool
    var checkbox: Bool
    var isSelected: Bool? = false 
    
    init(id:Int,title: String, subtitle: String , textBox: Bool, checkbox: Bool, isSelected: Bool?) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.textbox = textBox
        self.checkbox = checkbox
        self.isSelected = isSelected
    }
}
