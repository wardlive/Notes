//
//  DataController.swift
//  Notes
//
//  Created by Pavel Neprin on 10/21/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    // Respon sible for preparing a model
    let container = NSPersistentContainer(name: "NoteModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully!!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addNote(title: String, text: String, context: NSManagedObjectContext) {
        let note = Note(context: context)
        note.id = UUID()
        note.date = Date()
        note.title = title
        note.text = text
        
        save(context: context)
    }
    
    func editNote(note: Note, title : String, text: String, context: NSManagedObjectContext) {
        note.date = Date()
        note.title = title
        note.text = text
        
        save(context: context)
    }
}

