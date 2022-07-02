import Foundation
import SwiftUI

struct ButtonRow: ComponentBuilder {
    let viewModel: ButtonRowViewModel
    
    func toView() -> AnyView {
        AnyView(ButtonRowView(viewModel: self.viewModel))
    }
}

class ButtonRowViewModel {
    let title: String
    let buttonTitle: String
    let buttonAction: () -> Void

    init(
        title: String,
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }
}

struct ButtonRowView: View {
    let viewModel: ButtonRowViewModel

    var body: some View {
        HStack {
            Text(self.viewModel.title)
            Spacer()
            Button(
                self.viewModel.buttonTitle,
                action: self.viewModel.buttonAction
            )
        }
        .padding()
    }
}

struct ButtonRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                Spacer()
                ButtonRow(
                    viewModel: .init(
                        title: "Title",
                        buttonTitle: "buttonTitle",
                        buttonAction: { print("ACTION") }
                    )
                )
                .toView()
                    .background(Color.gray)
                Spacer()
            }
        }
    }
}
