//
//  FilterTabView.swift
//  Flicks
//
//  Created by Noel Obaseki on 11/06/2022.
//

import SwiftUI

struct FilterTabView: View {
    
    @Binding var selectedTab:  Endpoints.Movies.Category
    
     
    var body: some View {
            HStack(spacing: 25) {
                FilterTabItem(selectedTab: $selectedTab, tabType: .upcoming)
                FilterTabItem(selectedTab: $selectedTab, tabType: .top_rated)
                FilterTabItem(selectedTab: $selectedTab, tabType: .popular)
                FilterTabItem(selectedTab: $selectedTab, tabType: .now_playing)
            }
            
    }
}

//struct FilterTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterTabView()
//    }
//}
