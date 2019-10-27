//
//  CategoryRadioBoxView.swift
//  UralsibHakaton
//
//  Created by Denchik on 27.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct CategoryRadioBoxView: View {
    @EnvironmentObject var userData: UserData
    var answer: Answer
    let index: Int
    var answerIndex: Int {
        answer.id
    }
    
    @State var isShowed: Bool = false
    
    var body: some View {
        VStack( alignment: .leading, spacing: 10) {
            Text(answer.title).font(Fonts.cond(of: 22)).foregroundColor(Colors.main())
                .padding(.leading,10).onTapGesture {
                    withAnimation{
                        self.isShowed.toggle()
                    }
                }
            
            if isShowed {
                ForEach(answer.subanswers) { sub in
                    CategoriesRadioBox(sub: sub, index: self.index, answerIndex: self.answerIndex)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))).environmentObject(self.userData)
                    }
                
            }
         }
    }
}

struct CategoriesRadioBox: View {
     @EnvironmentObject var userData: UserData
    var sub : SubAnswer
    let index: Int
    let answerIndex: Int
    var subIndex: Int {
        userData.categories[index].answers[answerIndex].subanswers
            .firstIndex(where: { $0.id == sub.id })!}
    
    var body: some View {
        HStack(spacing: 10) {
            Circle().frame(width: 20, height: 26)
                .foregroundColor( self.userData.categories[self.index]
                .answers[self.answerIndex]
                .subanswers[self.subIndex]
                .isSelected
                    ?? false  ? .green : .white)
                .clipShape(Circle())
                .overlay(Circle()
                    .stroke(Color.black, lineWidth: 1))
                .shadow(radius: 1)
                .padding(.leading, 40)
            Text(sub.title).font(Fonts.medium(of: 18)).foregroundColor(Color(UIColor(red: 0.05, green: 0.2, blue: 0.39, alpha: 1)))
        }.onTapGesture {
            if self.userData.categories[self.index]
                .answers[self.answerIndex]
                .subanswers[self.subIndex]
                .isSelected == nil {
                
                self.userData.categories[self.index]
                .answers[self.answerIndex]
                    .subanswers.forEach { (sub) in
                        sub.isSelected = false
                }
                self.userData.categories[self.index]
                    .answers[self.answerIndex]
                    .subanswers[self.subIndex]
                    .isSelected = true
            }else {
                
                self.userData.categories[self.index]
                .answers[self.answerIndex]
                    .subanswers.forEach { (sub) in
                        sub.isSelected = false
                }
                
                self.userData.categories[self.index]
                    .answers[self.answerIndex]
                    .subanswers[self.subIndex]
                    .isSelected?.toggle()
            }
        }
    }
}

struct CategoryRadioBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRadioBoxView(answer: landmarkData[1].answers[0], index: 1).environmentObject(UserData())
    }
}
