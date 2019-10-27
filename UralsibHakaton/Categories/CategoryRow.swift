//
//  CategoryRow.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject var userData: UserData
    let category: Category
    @State var isShowed = false
    
    var index: Int {
           userData.categories.firstIndex(where: { $0.id == category.id })!
       }
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack(spacing: 40) {
                    Circle().frame(width: 28, height: 28).foregroundColor(userData.categories[index].isChecked() || category.id == 0 ? .green : .gray).clipShape(Circle())
                        .shadow(radius: 1)
                    
                    Text(category.title).font(Fonts.regular(of: 24)).foregroundColor(category.isChecked() || category.id == 0 ? .green : .gray)

                }.onTapGesture {
                    withAnimation{
                        self.isShowed.toggle()
                    }
                }
            
                if category.answers.count != 0 && isShowed{
                    CategorySelectInformation(answers: category.answers, index: self.index).transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))

                }
            

        }.frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading).padding(20)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(category: landmarkData[1]).environmentObject(UserData())
    }
}
