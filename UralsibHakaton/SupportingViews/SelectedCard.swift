//
//  SelectedCard.swift
//  UralsibHakaton
//
//  Created by Denchik on 26.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct SelectedCard: View {
    var type: Types
    
    
    
    var body: some View {
            Image(type.image)
            .resizable()
                .aspectRatio(type.label == "Другое" ? 3/2 : 2 / 3, contentMode: .fit)
            .overlay(TextOverlay(type: type))
    }
}

struct TextOverlay: View {
    var type: Types
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle().fill(gradient).cornerRadius(20)
            VStack(alignment: .leading) {
                Text(type.label)
                    .font(Fonts.semiBold(of: 30))
            }
            .padding(40)
        }
        .foregroundColor(Colors.main())
    }
}

struct SelectedCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCard(type: Types(id: 0, image: "ip", label: "ИП"))
    }
}
