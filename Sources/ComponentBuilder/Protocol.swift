import SwiftUI

protocol ComponentBuilder {
    func toView() -> AnyView
    var id: String { get }
}

extension ComponentBuilder {
    var id: String { String(describing: self) }
}
