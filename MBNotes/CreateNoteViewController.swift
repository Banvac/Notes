//
//  CreateNoteViewController.swift
//  MBNotes
//
//  Created by Stas on 02.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit

class CreateNoteViewController: UIViewController {
    
    @IBOutlet weak var noteNameText: UITextField!
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNoteBtn(_ sender: UIButton) { //добавить экземпляр сущности
        if !(noteNameText.text!.isEmpty) || !(noteText.text!.isEmpty) {
            if CoreDataHandler.saveObject(name: noteNameText.text!, text: noteText.text, creatingDate: currentDate as Date, editingDate: currentDate as Date) {
            }
            noteNameText.text! = ""
            noteNameText.placeholder = "Note saved"
            noteText.text = ""
        } else {
            noteNameText.placeholder = "Enter note name or text."
        }
        notes = CoreDataHandler.fetchNotes()
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
    

