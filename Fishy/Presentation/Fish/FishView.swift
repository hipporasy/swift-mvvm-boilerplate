//
//  FishView.swift
//  Fishy
//
//  Created by Marasy Phi on 12/2/22.
//

import Foundation
import SwiftUI

struct FishView: BaseView {
    
    let viewModel: FishViewModel
    
    init(_ viewModel: FishViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
        }
    }
    
}


struct CLontentView: View {
    
    var body: some View {
        VStack {
            
        }
        .fullScreenCover(isPresented: .constant(true), content: Injector.shared.resolve(FishView.self))
    }
    
}
