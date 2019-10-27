//
//  CategorySelectInformation.swift
//  UralsibHakaton
//
//  Created by Denchik on 27.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct CategorySelectInformation: View {
    @EnvironmentObject var userData: UserData
    var answers: [Answer]
    let index: Int
    
    
        var body: some View {
            VStack(alignment: .leading){
                
                ForEach(answers) { (ans) in
                    CategoryRadioBoxView(answer: ans, index: self.index)
                }
            }.frame(minWidth: 0,  maxWidth: .infinity,alignment: .leading)
    }
}

struct CategorySelectInformation_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectInformation(answers: landmarkData[1].answers, index: 1).environmentObject(UserData())
    }
}
