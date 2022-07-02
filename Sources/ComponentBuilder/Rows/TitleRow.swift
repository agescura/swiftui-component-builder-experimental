import Foundation
import SwiftUI

struct TitleRow: ComponentBuilder {
    let viewModel: TitleRowViewModel
    
    func toView() -> AnyView {
        AnyView(TitleRowView(viewModel: self.viewModel))
    }
}

extension ComponentBuilder {
    static func title(_ title: String) -> AnyView {
        TitleRow(viewModel: .init(title: title)).toView()
    }
}

class TitleRowViewModel {
    let title: String

    init(
        title: String
    ) {
        self.title = title
    }
}

struct TitleRowView: View {
    let viewModel: TitleRowViewModel

    var body: some View {
        HStack {
            Text(self.viewModel.title)
            Spacer()
        }
        .padding()
    }
}

struct TitleRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                Spacer()
                TitleRow(viewModel: .init(title: "Title")).toView()
                    .background(Color.gray)
                Spacer()
            }
        }
    }
}
