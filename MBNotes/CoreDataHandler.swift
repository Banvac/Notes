//
//  CoreDataHandler.swift
//  MBNotes
//
//  Created by Stas on 02.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    class func saveObject(name: String, text: String, creatingDate: Date, editingDate: Date) -> Bool {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let manageObject = NSManagedObject(entity: entity!, insertInto: context)
        
        manageObject.setValue(name, forKey: "name")
        manageObject.setValue(text, forKey: "text")
        manageObject.setValue(creatingDate, forKey: "creatingDate")
        manageObject.setValue(editingDate, forKey: "editingDate")
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func fetchObject() -> [Note]? {
        let context = getContext()
        var note:[Note]? = nil
        
        do {
            note = try context.fetch(Note.fetchRequest())
            return note
        } catch {
            return note
        }
    }
    //------------------------------------------
    
    class func deleteObject(note: Note) -> Bool {
        
        let context = getContext()
        context.delete(note)
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func cleanDelete() -> Bool {
        
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: Note.fetchRequest())
        
        do {
            try context.execute(delete)
            return true
        } catch {
            return false
        }
    }

}
