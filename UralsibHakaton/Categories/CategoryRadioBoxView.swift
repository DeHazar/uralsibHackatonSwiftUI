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
    @State var otherText: String = ""
    
    var body: some View {
        VStack( alignment: .leading, spacing: 10) {
            if answer.subanswers.count == 0 {
                HStack(spacing: 10) {
                    Circle().frame(width: 20, height: 26)
                        .foregroundColor( self.userData.categories[self.index]
                        .answers[self.answerIndex]
                        .isSelected
                            ?? false  ? .green : .white)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(Color.black, lineWidth: 1))
                        .shadow(radius: 1)
                        .padding(.leading, 20)
                    Text(answer.title).font(Fonts.medium(of: 18)).foregroundColor(Color(UIColor(red: 0.05, green: 0.2, blue: 0.39, alpha: 1)))
                }.onTapGesture {
                    if self.userData.categories[self.index].checked != nil {
                        self.userData
                            .categories[self.index]
                            .checked?.toggle()
                    }else {
                        self.userData
                            .categories[self.index]
                            .checked = true
                    }
                    self.userData.categories[self.index]
                                                                        .answers =
                                                         self.userData.categories[self.index]
                                                                            .answers.map { (sub) -> Answer in
                                                                 var copy = sub
                                                                 copy.isSelected = false
                                                                 return copy
                                                         }
                    
                    if self.userData.categories[self.index]
                    .answers[self.answerIndex]
                        .isSelected != nil {
                        
                        self.userData.categories[self.index]
                        .answers[self.answerIndex]
                            .isSelected?.toggle()
                    }else {
                        
                        
                        self.userData.categories[self.index]
                        .answers[self.answerIndex]
                            .isSelected = true
                    }
                }
                }else {
                HStack (spacing: 10) {
                    Text(answer.title).font(Fonts.cond(of: 22)).foregroundColor(Colors.main())
                    .padding(.leading,10)
                    
                    Image(systemName: "chevron.right.circle")
                                           .imageScale(.large)
                                           .rotationEffect(.degrees(isShowed ? 90 : 0))
                                           .scaleEffect(isShowed ? 1.5 : 1)
                                           .padding()
                }
                .onTapGesture {
                        withAnimation{
                            self.isShowed.toggle()
                        }
                    }
                    
                }
                
            if answer.textbox {
                TextField("Введите название", text: $otherText ).padding(10)
            }
            
            
            if isShowed {
                if answer.subanswers.count == 0 {
                    
                }else {
                    ForEach(answer.subanswers) { sub in
                        CategoriesRadioBox(sub: sub, index: self.index, answerIndex: self.answerIndex)
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))).environmentObject(self.userData)
                        }
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
                
                self.setFalseSubAnswerSelect()
                self.userData.categories[self.index]
                    .answers[self.answerIndex]
                    .subanswers[self.subIndex]
                    .isSelected = true
                self.userData.categories[self.index].checked = true
            }else {
                self.setFalseSubAnswerSelect()
          
                self.userData.categories[self.index]
                    .answers[self.answerIndex]
                    .subanswers[self.subIndex]
                    .isSelected?.toggle()
                self.userData.categories[self.index].checked = true
            }
        }
    }
    
    func setFalseSubAnswerSelect() {
        self.userData.categories[self.index]
        .answers[self.answerIndex]
        .subanswers = self.userData.categories[self.index]
            .answers[self.answerIndex]
            .subanswers.map { (subanswer) -> SubAnswer in
                var copy = subanswer
                copy.isSelected = false
                return copy
        }
        
        self.userData.categories[self.index]
        .answers = self.userData.categories[self.index]
            .answers.map { (ans) -> Answer in
                var copyAns = ans
                var copy = ans.subanswers.map { (sub) -> SubAnswer in
                    var copy = sub
                    copy.isSelected = false
                    return copy
                }
                copyAns.subanswers = copy
                return copyAns
        }
    }
}



struct CategoryRadioBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRadioBoxView(answer: landmarkData[1].answers[0], index: 1).environmentObject(UserData())
    }
}
