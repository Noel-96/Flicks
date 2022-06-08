//
//  OfflineBarView.swift
//  Flicks
//
//  Created by Noel Obaseki on 05/06/2022.
//

import SwiftUI

struct OfflineBarView: View {
    var body: some View {
        VStack {
            Text("Offline")
                .padding(4)
                .frame(maxWidth: .infinity)
        }
        .background(.gray)
    }

}

struct OfflineBarView_Previews: PreviewProvider {
    static var previews: some View {
        OfflineBarView()
    }
}
