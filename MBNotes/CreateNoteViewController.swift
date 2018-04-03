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
            if CoreDataHandler.saveObject(name: noteNameText.text!, text: noteText.text, creatingDate: date1 as Date, editingDate: date1 as Date) {
            }
            noteNameText.text! = ""
            noteNameText.placeholder = "Note saved"
            noteText.text = ""
        } else {
            noteNameText.placeholder = "Enter note name or text."
        }
        note = CoreDataHandler.fetchObject()
    }
}
    

