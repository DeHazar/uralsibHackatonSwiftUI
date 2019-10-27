//
//  CategoriesView.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct CategoriesView: View {
    @EnvironmentObject private var userData: UserData
   
    var body: some View {
        List {
            ForEach(userData.categories) { cat in
                CategoryRow(category: cat).background(Color.white).onTapGesture {
                    print(cat.id)
                }
                
            }
            
            if userData.categories.filter({ (cat) -> Bool in
                cat.isChecked() == false
            }).count == 0 {
                Text("Завершить")
                    .font(Fonts.regular(of: 18))
                    .foregroundColor(.white)
                    .padding(20)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }else {
                Text("Завершить досрочно").font(Fonts.regular(of: 18))
                    .foregroundColor(.black)
                    .padding(20)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                )
            }

        }.background(Color.white).onAppear { UITableView.appearance().separatorStyle = .none } .onDisappear { UITableView.appearance().separatorStyle = .singleLine }.navigationBarItems(trailing: uralsibLogo()
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 80)
            ))
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView().environmentObject(UserData())
    }
}
