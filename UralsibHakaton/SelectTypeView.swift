//
//  SelectType.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct SelectTypeView: View {
    
    //MARK: - Parametrs
    var selects: [Types] = [Types(id:0, image: "ip", label: "ИП"),
                            Types(id:1, image: "ooo", label: "ООО"),
                            Types(id:2, image: "other", label: "Другое")]
    
    //MARK: - Views
      
      var uralsibButton: some View {
            Button(action: { print("taped") }) {
              Image("logo")
                  .resizable()
                  .frame(width: 200, height: 45, alignment: .trailing)
                    .accessibility(label: Text("User Profile"))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 90))
            }
        }
      
   
    
    var body: some View {
//        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Colors.main(),Colors.additional()]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Color.yellow.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)

                    Color.green.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                    
                    Text("Калькулятор тарифов").font(Fonts.cond(of: 30))
                    .padding([.top], 30)
                    .foregroundColor(Color.white)
                    Spacer()
                    
                }
                
                VStack (spacing: 18){
                    
                    HStack(alignment: .center, spacing: 10) {
                        SelectedCard(type: selects[0])
                        
                        SelectedCard(type: selects[1])
                    }
                    
                    SelectOther(type: selects[2])
                }.padding([.leading, .trailing], 18 )
//            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .navigationBarTitle(Text(""),
                                displayMode: .inline)
                    .navigationBarItems( trailing: uralsibButton)
        }
    }
}

struct SelectTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SelectTypeView()
    }
}
