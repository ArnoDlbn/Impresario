//
//  StartView.swift
//  Impresario
//
//  Created by Arnaud Dalbin on 25/04/2021.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            AuthenticationView()
            RegisterView()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
