//
//  NotesTableViewController.swift
//  MBNotes
//
//  Created by Stas on 04.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        notes = CoreDataHandler.fetchNotes()
    }

    override func viewDidAppear(_ animated: Bool) { // refresh tpdf
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes!.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        
        cell.noteNameLbl.text! = notes![indexPath.row].name!
        cell.noteCreateDateLbl.text! = String("Creating date: " + dateform.string(from: notes![indexPath.row].creatingDate!))
        cell.viewCell.layer.cornerRadius = 6
        
        return cell
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { nil error O_O
    //let selectedIndexPath = tableView.indexPathForSelectedRow?.row
    //let destination = segue.destination as? DetailNoteViewController
    //destination!.name = note![(tableView.indexPathForSelectedRow?.row)!].name
    //}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //to note detail
        indexForChangeNote = indexPath.row
        noteToDetail = notes![indexPath.row]
        performSegue(withIdentifier: "toNoteDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if CoreDataHandler.deleteObject(note: notes![indexPath.row]) { // удалить 1 объект
                notes = CoreDataHandler.fetchNotes()
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func addNewNoteBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddNote", sender: nil)
    }
    
    
}
