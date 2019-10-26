//
//  Fonts.swift
//  Unwayl
//
//  Created by ivan on 11/05/2019.
//  Copyright © 2019 ivan. All rights reserved.
//

import SwiftUI

struct Fonts {
    static func regular(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillic-Regular",size: size )
    }
    
    static func medium(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillicMedium", size: size)
    }
    
    static func semiBold(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillicSemiBold", size: size)
    }
    
    static func bold(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillic-Bold", size: size)
    }
    
    static func cond(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillicCnd-Regular", size: size)
    }
    
    static func condSemibold(of size: CGFloat) -> Font {
        return Font.custom("OmnesCyrillicCndSemiBold", size: size)
    }
}
