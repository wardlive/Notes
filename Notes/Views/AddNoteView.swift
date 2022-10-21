//
//  AddNoteView.swift
//  Notes
//
//  Created by Pavel Neprin on 10/21/22.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var text = ""
    
    var body: some View {
        Form {
            Section() {
                TextField("Note", text: $title)
                TextField("Free your mind", text: $text)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            }
            Section() {
                    Button("Done") {
                        DataController().addNote(title: title, text: text, context: managedObjContext)
                        dismiss()
                }
            }
        }
        .background(.ultraThinMaterial)
    }
}


struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}


