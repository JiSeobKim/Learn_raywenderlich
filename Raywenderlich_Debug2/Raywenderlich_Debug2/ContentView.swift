//
//  ContentView.swift
//  Raywenderlich_Debug2
//
//  Created by kimjiseob on 2019/06/14.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var cnt = 0
    
    var body: some View {
        PresentationButton(Text("Wow"), destination: TempTableViewController())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
