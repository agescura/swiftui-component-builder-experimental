import Foundation
import SwiftUI

struct ForEachRow: View {
    @State var rows: [ComponentBuilder]
    
    init(
        rows: [ComponentBuilder]
    ) {
        self.rows = rows
    }
    
    var body: some View {
        ForEach(self.rows, id: \.id) { row in
            row.toView()
        }
    }
}

struct ForEachRow_Previews: PreviewProvider {
    @State static var title = "title"
    
    static var previews: some View {
        NavigationView {
            List {
                ForEachRow(
                    rows: [
                        TitleRow(
                            viewModel: .init(title: self.title)
                        ),
                        ButtonRow(
                            viewModel: .init(
                                title: "Title",
                                buttonTitle: "buttonTitle",
                                buttonAction: { self.title = "new title" }
                            )
                        )
                    ]
                )
            }
        }
    }
}
