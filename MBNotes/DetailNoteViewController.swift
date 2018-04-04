//
//  DetailNoteViewController.swift
//  MBNotes
//
//  Created by Stas on 02.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit

class DetailNoteViewController: UIViewController {
    
    @IBOutlet weak var noteNameLblDN: UITextField!
    @IBOutlet weak var textNoteDN: UITextView!
    @IBOutlet weak var creationDateLblDN: UILabel!
    @IBOutlet weak var editingDateLblDN: UILabel!
    
    var currentNote: Note?
    //var onSaveAction: ((Note) -> Void)?
    
    let dateform = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateform.dateStyle = .medium // date
        //print("DATE: \(dateform.string(from: currentDate as Date))") // date
        
        noteNameLblDN.text = currentNote?.name
        textNoteDN.text = currentNote?.text
        creationDateLblDN.text = dateform.string(from: (currentNote?.creatingDate)!)
        editingDateLblDN.text = dateform.string(from: (currentNote?.editingDate)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveChangeBtnDN(_ sender: UIButton) {//save btn
        
        //это вроде сохраняет
        currentNote?.setValue(noteNameLblDN.text, forKey: "name")
        currentNote?.setValue(textNoteDN.text, forKey: "text")
        currentNote?.setValue(NSDate() as Date, forKey: "editingDate")
        
        do {
            try currentNote?.managedObjectContext?.save()
            } catch {
                print(error)
            }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
