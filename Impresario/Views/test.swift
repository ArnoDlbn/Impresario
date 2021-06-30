//
//  test.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 16/05/2021.
//

import SwiftUI

struct test: View {
    var durationsIndex = 0
    var durations = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]

    var body: some View {
        VStack(spacing: 3) {
            HStack(spacing: 3){
                ForEach(0..<3) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.init(.darkGray))
                        .frame(width: 70, height: 30, alignment: .center)
                        .overlay(Button("\(self.durations[$0]) min", action: {})
                                    .foregroundColor(.white)
                        )
                    
                }
            }
            HStack(spacing: 3){
                ForEach(3..<6) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.init(.darkGray))
                        .frame(width: 70, height: 30, alignment: .center)
                        .overlay(Button("\(self.durations[$0]) min", action: {})
                                    .foregroundColor(.white)
                        )
                }
            }
            HStack(spacing: 3){
                ForEach(6..<9) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.init(.darkGray))
                        .frame(width: 70, height: 30, alignment: .center)
                        .overlay(Button("\(self.durations[$0]) min", action: {})
                                    .foregroundColor(.white)
                        )
                }
            }
            HStack(spacing: 3){
                ForEach(9..<12) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.init(.darkGray))
                        .frame(width: 70, height: 30, alignment: .center)
                        .overlay(Button("\(self.durations[$0]) min", action: {})
                                    .foregroundColor(.white)
                        )
                }
            }
        }
    }

}
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
