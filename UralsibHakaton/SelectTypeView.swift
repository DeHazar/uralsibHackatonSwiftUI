//
//  SelectType.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct SelectTypeView: View {
    @EnvironmentObject private var userData: UserData
    
    //MARK: - Parametrs
    var selects: [Types] = [Types(id:0, image: "ip", label: "ИП"),
                            Types(id:1, image: "ooo", label: "ООО"),
                            Types(id:2, image: "other", label: "Другое")]
    
    //MARK: - Views

      
   
    
    var body: some View {
//        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Colors.main(),Colors.additional()]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Color.yellow.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)

                    Color.green.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                    Text(verbatim: "Калькулятор тарифов").font(Fonts.cond(of: 30)).padding([.top], 30)
                    .foregroundColor(Color.white)
                    
                    VStack (spacing: 18){
                        
                        HStack(alignment: .center, spacing: 10) {
                            NavigationLink(destination:
                                CategoriesView()){
                                    SelectedCard(type: selects[0])
                            }.buttonStyle(PlainButtonStyle())
                            
                            NavigationLink(destination:
                                CategoriesView()){
                                    SelectedCard(type: selects[1])
                            }.buttonStyle(PlainButtonStyle())
                        }
                 
                            SelectOther(type: selects[2])
                    }.padding([.leading, .trailing], 18 )
                    
                    Spacer()
                    
                }
//            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle(Text(""),
                                displayMode: .inline)
                    .navigationBarItems( trailing: uralsibLogo()
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 80)))
        }
    }
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView().environmentObject(UserData())
    }
}
