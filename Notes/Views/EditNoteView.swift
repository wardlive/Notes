//
//  EditNoteView.swift
//  Notes
//
//  Created by Pavel Neprin on 10/21/22.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var note: FetchedResults<Note>.Element
    
    @State private var title = ""
    @State private var text = ""
    
    var body: some View {
        Form {
            Section() {
                VStack {
                    TextField("\(note.title!)", text: $title)
                        .bold()
                        .onAppear {
                            title = note.title!
                        }
                    TextField("\(note.text!)", text: $text, axis: .vertical)
                        .lineLimit(5...25)
                        .onAppear {
                            text = note.text!
                        }
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                }
            }
            .onDisappear() {
                DataController().editNote(note: note, title: title, text: text, context: managedObjContext)
                dismiss()
            }
        }
    }
}

//struct EditNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditNoteView()
//    }
//}
