//
//  CellItems.swift
//  Raywenderlich_Debug2
//
//  Created by kimjiseob on 2019/06/15.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import SwiftUI

struct CellItems : View {
    var items: [String]
    var body: some View {
        VStack {
            ForEach(items.identified(by: \.self)) {
                Text($0)
            }
        }
    }
}

#if DEBUG
struct CellItems_Previews : PreviewProvider {
    static var previews: some View {
        
        CellItems(items: ["kim","ji","seob"])
    }
}
#endif
