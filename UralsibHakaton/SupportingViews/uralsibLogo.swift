//
//  uralsibLogo.swift
//  UralsibHakaton
//
//  Created by Denchik on 27.10.2019.
//  Copyright © 2019 bessovestniy-design. All rights reserved.
//

import SwiftUI

struct uralsibLogo: View {
    var body: some View {
        
        Button(action: { print("taped") }) {
          Image("logo")
              .resizable()
              .frame(width: 200, height: 45, alignment: .trailing)
                .accessibility(label: Text("User Profile"))
        }
    }
}

struct uralsibLogo_Previews: PreviewProvider {
    static var previews: some View {
        uralsibLogo()
    }
}
