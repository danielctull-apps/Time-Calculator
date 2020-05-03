
import SwiftUI

extension Picker
    where
SelectionValue: CaseIterable,
SelectionValue: Comparable,
SelectionValue: CustomStringConvertible,
SelectionValue: Identifiable,
Content == ForEach<[SelectionValue], SelectionValue.ID, Text> {

    init(selection: Binding<SelectionValue>, label: Label) {
        self.init(selection: selection, label: label) {
            ForEach(SelectionValue.allCases.sorted(by: <)) { value in
                Text(value.description)
            }
        }
    }
}
