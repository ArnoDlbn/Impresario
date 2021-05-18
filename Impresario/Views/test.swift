//
//  test.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct test: View {
    var body: some View {
        TabView {
                    Text("First")
                    Text("Second")
                    Text("Third")
                    Text("Fourth")
                }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))


    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
