//
//  OfferSecondView.swift
//  UralsibHakaton
//
//  Created by Denchik on 27.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct OfferSecondView: View {
     var body: some View {
           ZStack {
               LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 0.17, green: 0.33, blue: 0.57, alpha: 0.63)), Colors.additional()]), startPoint: .top, endPoint: .bottom)
               .edgesIgnoringSafeArea(.all)
               VStack {
               
                   Spacer()
                   
                   CardsStackView2()
                   Spacer()
                   
               }.padding(.top, 44)
           }.navigationBarItems(trailing: uralsibLogo()
           .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 80)
           ))
       }
}

// Make new .swift file!
struct CardView2: View {
    var body: some View {
        VStack(alignment: .center) {
//            Text("Бизнес-Старт").font(Fonts.bold(of: 30))
//                .frame(width: 300, height: 60).background(Colors.additional())
                
            VStack {
                Text("Большое количество платежей и наличной выручки")
                    .font(.subheadline)
                    .fontWeight(.semibold).frame(width: 320, height: 60, alignment: .center).multilineTextAlignment(.center).padding(.top,100).lineLimit(4)
                    
                
                Text("0 ₽ за открытие и \nведение счета в валюте")
                    .font(.body)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Text("4700 ₽/мес.").font(Fonts.regular(of: 48)).foregroundColor(.black)
                    .padding(.top, 10)
            }.padding()
            
            Button(action: {
                print("Tap tap tap...")
            }) {
                Text("Узнать больше?").font(Fonts.regular(of: 20))
                    .foregroundColor(Color.black)
                    .padding()
                    .background(Color(red: 1.0, green: 0.6, blue: 0, opacity: 0.6))
                    .cornerRadius(12)
            }.padding()
        }
        .padding(1)
        .background(Color.white)
        .cornerRadius(28)
    }
}


struct CardsStackView2: View {
    var body: some View {
        ZStack {
            Text("Финансово-активным").font(Fonts.bold(of: 30))
                .frame(width: 360, height: 60).background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)
            ).shadow(radius: 10).offset(x: 0, y: -140).zIndex(1000).foregroundColor(.white)
            
            Rectangle()
                .foregroundColor(Color.white)
                .cornerRadius(28)
                .opacity(0.4)
                .offset(x: 0, y: 108)
                .frame(width: 290, height: 280)
            
            CardView2()
        }
    }
}


struct OfferSecondView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSecondView()
    }
}
