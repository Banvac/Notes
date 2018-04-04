//
//  NotesTableViewController.swift
//  MBNotes
//
//  Created by Stas on 04.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    var notes:[Note] = []
    var currentNote: Note?
    
    let dateform = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //for i in 0...4 {
        //CoreDataHandler.saveObject(name: "NOTE \(i)", text: "NOTE \(i)", creatingDate: NSDate() as Date, editingDate: NSDate() as Date)
        //}
        
        dateform.dateStyle = .medium
        notes = CoreDataHandler.fetchNotes()!
    }

    override func viewDidAppear(_ animated: Bool) { // refresh tpdf
        super.viewDidAppear(animated)
        
        notes = CoreDataHandler.fetchNotes()!
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        
        cell.noteNameLbl.text! = notes[indexPath.row].name! // error
        cell.noteCreateDateLbl.text! = String("Creating date: " + dateform.string(from: notes[indexPath.row].creatingDate!))
        cell.viewCell.layer.cornerRadius = 6
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailNoteViewController {
            destination.currentNote = currentNote
        }
        
        
        //if currentNote != nil {
            //destination!.currentNote = currentNote //NIL ERROR
        //}
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentNote = notes[indexPath.row]
        performSegue(withIdentifier: "toNoteDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if CoreDataHandler.deleteObject(note: notes[indexPath.row]) { // удалить 1 объект
                notes = CoreDataHandler.fetchNotes()!
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func addNewNoteBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddNote", sender: nil)
    }
    
    @IBAction func delAllBtn(_ sender: UIButton) {
        if CoreDataHandler.cleanDelete() {
            notes = CoreDataHandler.fetchNotes()!
            print(notes.count)
            tableView.reloadData()
        }
    }
    
    
    
}
