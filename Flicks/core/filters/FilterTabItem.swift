//
//  FilterTabItem.swift
//  Flicks
//
//  Created by Noel Obaseki on 11/06/2022.
//

import SwiftUI

struct FilterTabItem: View {
    
    @Binding var selectedTab: Endpoints.Movies.Category
    let tabType: Endpoints.Movies.Category
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                self.selectedTab = tabType
            } label: {
                    Text(tabType.rawValue)
                        .font(selectedTab == tabType ? .interBold : .interRegular)
                        .foregroundColor(selectedTab == tabType ? .black : .black)
                        .font(Font.custom("Inter-Bold", size: 14))
                        .lineLimit(1)

            }
            if selectedTab == tabType {
                Rectangle()
                    .frame(width: 39, height: 2)
                    .foregroundColor(.red)
            }
        }
    }
}

//struct FilterTabItem_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterTabItem()
//    }
//}
