//
//  SelectOther.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct SelectOther: View {
    let type: Types
    @State var searchText: String = ""
    @State var clicked: Bool = false
    var body: some View {
        VStack (spacing: 20) {
            SelectedCard(type: type).onTapGesture {
                withAnimation {
                    self.clicked.toggle()
                }
            }
            if clicked {
                VStack(alignment: .leading){
                    TextField("Введите ", text: $searchText).padding(10)
                        .cornerRadius(10)
                        .background(Color(hex: "EEEEEE"))
                        .foregroundColor(.white)
                    VStack {
                        HStack (spacing: 10) {
                            Text("ПАО").underline()
                            Text("Самозанятой").underline()
                        }
                        
                        Text("Далее")
                            .padding([.leading, .trailing], 40)
                            .padding([.top, .bottom], 20)
                            .font(Fonts.regular(of: 18))
                            .foregroundColor(.white)
                            .background(Color.green)
                    }
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing] , 20).transition(.move(edge: .top))
                }
            }
        }
    }
}

struct SelectOther_Previews: PreviewProvider {
    static var previews: some View {
        SelectOther(type: Types(id: 1, image: "other", label: "Другое"))
    }
}
