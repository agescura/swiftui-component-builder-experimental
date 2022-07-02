# SwiftUI Component Builder Experimental

Motivation

I want to build a detail view building the view model.

```swift
class ContentViewModel: ObservableObject {
    @Published var title = "title"
    @Published var buttonTitle = "buttonTitle"
    
    func buttonAction() {
    }
}

struct Content: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        List {
            HStack {
                Text(self.viewModel.title)
                Spacer()
            }
            .padding()
            
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
}
```

This is a verbose code. I want the ability to create different components and to preserve scalability and rehusability.

```swift
class ContentViewModel: ObservableObject {
    @Published var rows = [
        .title(.init(title: "title")),
        .button(.init("buttonTitle", action: { }))
    ]
}

struct Content: View {
    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        List {
            ForEach(self.viewModel.rows) { row in
                row.buildView()
            }
        }
    }
}
```
