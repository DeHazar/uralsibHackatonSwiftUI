//
//  APISingeltone.swift
//  UralsibHakaton
//
//  Created by Denchik on 27.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI


class APISingltone {
    
    public static let shared: APISingltone = APISingltone()
    
    private init() {
        
    }
    
    private var categories: [Category] = landmarkData
    
    func changeCategoryStatus(category:Category) {
        var index = 0
        categories.forEach { (cat) in
            if cat == category {
                return
            }else {
                index += 1
            }
        }
        
        categories[index].checked?.toggle()
    }
    
    func getCategories() -> [Category] {
        return categories
    }
}
