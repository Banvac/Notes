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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateform.dateStyle = .medium // date
        //print("DATE: \(dateform.string(from: currentDate as Date))") // date
        
        noteNameLblDN.text = noteToDetail?.name
        textNoteDN.text = noteToDetail?.text
        creationDateLblDN.text = dateform.string(from: (noteToDetail?.creatingDate)!)
        editingDateLblDN.text = dateform.string(from: (noteToDetail?.creatingDate)!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveChangeBtnDN(_ sender: UIButton) {//save btn
        
        //это вроде сохраняет
        notes![indexForChangeNote].setValue(noteNameLblDN.text, forKey: "name")
        notes![indexForChangeNote].setValue(textNoteDN.text, forKey: "text")
        notes![indexForChangeNote].setValue(currentDate as Date, forKey: "editingDate")
        
        do {
            try notes![indexForChangeNote].managedObjectContext?.save()
            } catch {
                print(error)
            }
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
