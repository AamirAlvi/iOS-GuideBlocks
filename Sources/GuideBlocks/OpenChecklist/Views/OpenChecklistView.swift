//
//  OpenChecklistView.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/8.
//  Copyright © 2024 Contextual.
//

import ContextualSDK
import SwiftUI

struct OpenChecklistView: View {
    var buttonTextElement: SHTipTextElement?
    var imageElement: SHTipImageElement?
    @ObservedObject var viewModel: OpenChecklistViewModel
    var closeButtonTapped: () -> ()
    
    var body: some View {
        ZStack {
            if viewModel.taskListVisible {
                Button(
                    action: {
                        viewModel.isPopupVisible.toggle()
                        print("Do list button tapped")
                    },
                    label: {
                        Text(viewModel.title)
                            .contextualTextFormat(buttonTextElement)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                )
                CloseButtonView(
                    imageElement: imageElement,
                    offsetX: 100,
                    offsetY: -100,
                    closeButtonTapped: {
                        closeButtonTapped()
                        viewModel.taskListVisible = false
                    }
                )
            }
        }
        .sheet(isPresented: $viewModel.isPopupVisible) {
            if #available(iOS 16.0, *) {
                TaskListView(viewModel: viewModel)
                    .presentationDetents([.medium, .large])
            } else {
                TaskListView(viewModel: viewModel)
            }
        }
    }
}

struct OpenChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        OpenChecklistView(
            viewModel: openChecklistViewModel,
            closeButtonTapped: {
            }
        )
    }
}
