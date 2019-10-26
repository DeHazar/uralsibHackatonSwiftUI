//
//  ContentView.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.1882352941, green: 0.2470588235, blue: 0.6235294118, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)]
    }
    
    var uralsibButton: some View {
          Button(action: { print("taped") }) {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 45, alignment: .center)
                  .accessibility(label: Text("User Profile"))
                  .padding(EdgeInsets(top: 0, leading: 100, bottom: 10, trailing: 10))
          }
      }
    
    var enterButton: some View {
        Button(action: { print("Войти") }) {
            Text("Войти или зарегистрироваться").font(Fonts.regular(of: 18)).foregroundColor(.white)
        }.frame(width: UIScreen.main.bounds.width - 80, height: 20, alignment: .center)
    }
    
    var mainButton: some View {
      Text("Получить предложение").font(Fonts.regular(of: 18)).foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width - 80, height: 20, alignment: .center)
              
    }
    
    var chatButton: some View {
        Button(action: {print("dasda")}) {
           VStack {
               Image("credit-card")
               Text("С карты на карту")
           }
       }.frame(width: UIScreen.main.bounds.width - 80, height: 120, alignment: .center)
            .background(Colors.additional()).foregroundColor(.white)
    }
   
    
    fileprivate func getViews(image: String, label: String) -> Button<VStack<TupleView<(Image, Text)>>> {
        return Button(action: {print("dasda")}) {
            VStack {
                Image(image)
                Text(label)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack
                 {
                    LinearGradient(gradient: Gradient(colors: [Colors.main(),Colors.additional()]),
                                   startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        Color.yellow.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)

                        Color.green.frame(width: UIScreen.main.bounds.width, height: 2, alignment: .center)
                        
                        
                        VStack(spacing: 5) {
                             chatButton
                            HStack(spacing: 5) {
                                getViews(image: "money", label: "Курсы валют").frame(width: (UIScreen.main.bounds.width - 85) / 2, height: 120, alignment: .center)
                                    .background(Colors.additional())
                                .foregroundColor(.white)
                                
                                getViews(image: "speech-bubble", label: "Сообщения").frame(width: (UIScreen.main.bounds.width - 85) / 2, height: 120, alignment: .center)
                                .background(Colors.additional())
                                    .foregroundColor(.white)
                            }
                        }.padding(.top, 40)
                       
                        
//                        getPlaneButton(imageName: "speech-bubble", label: "Сообщения")
//                            .background(Colors.additional())
                            Spacer()
                    
                        VStack(spacing: 20) {
                            
                            enterButton.padding([.top, .bottom], 20)
                                .background(Color.green)
                            
                            NavigationLink(destination: SelectTypeView()) {
                                mainButton.padding([.top, .bottom], 20)
                                .background(Color.green)
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .navigationBarTitle(Text(""),
                                        displayMode: .inline)
                        .navigationBarItems(leading: uralsibButton)
            }
        }.onTapGesture {
            self.endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
