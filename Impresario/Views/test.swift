//
//  test.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct test: View {
    var body: some View {
        NavigationView {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            Text("Title")
                            Text("")
                        }
                        .foregroundColor(.red)
                        .font(.custom("Marker Felt Wide", size: 25, relativeTo: .largeTitle))
                    }
                }
                .accentColor(.black)
        }
    }
}
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
