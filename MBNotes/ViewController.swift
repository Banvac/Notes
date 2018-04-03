//
//  ViewController.swift
//  MBNotes
//
//  Created by Stas on 01.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() { //DID LOAD
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dateform.dateStyle = .medium // date
        print("DATE: \(dateform.string(from: date1 as Date))") // date
        
        note = CoreDataHandler.fetchObject()
    } // DID LOAD
    
    //tableView//
    //че она серая то?
    override func viewDidAppear(_ animated: Bool) { // refresh tpdf
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return note!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! NoteTableViewCell
        
        cell.noteNameLbl.text! = note![indexPath.row].name!
        cell.noteCreateDateLbl.text! = dateform.string(from: date1 as Date) //String(describing: note![indexPath.row].creatingDate!)
        cell.viewCell.layer.cornerRadius = cell.viewCell.frame.height / 2
        
        return cell
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) { nil error O_O
        //let selectedIndexPath = tableView.indexPathForSelectedRow?.row
        //let destination = segue.destination as? DetailNoteViewController
        //destination!.name = note![(tableView.indexPathForSelectedRow?.row)!].name
    //}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //to note detail
        indexForChangeNote = indexPath.row
        noteToDetail = note![indexPath.row]
        performSegue(withIdentifier: "toNoteDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if CoreDataHandler.deleteObject(note: note![indexPath.row]) { // удалить 1 объект
             note = CoreDataHandler.fetchObject()
            tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func delAllBtn(_ sender: UIButton) {
        if CoreDataHandler.cleanDelete() {
            note = CoreDataHandler.fetchObject()
            print(note!.count)
            tableView.reloadData()
        }
    }
    
}
///////////////////////////////////////////
    
//    @IBAction func delBtn(_ sender: UIButton) {
//        if CoreDataHandler.cleanDelete() { //del all
//            note = CoreDataHandler.fetchObject()
//            print(note!.count)
//        }
//    }
//    @IBAction func addBtn(_ sender: Any) { //добавить экземпляр сущности
//        if CoreDataHandler.saveObject(name: <#String#>, text: <#String#>, creatingDate: date1 as Date, editingDate: date1 as Date) {
//        }
//        note = CoreDataHandler.fetchObject()
//    }
//
//    @IBAction func delBtn(_ sender: Any) {// удалить все к чертовой матери
//        if CoreDataHandler.cleanDelete() {
//            note = CoreDataHandler.fetchObject()
//            print(note!.count)
//        }
//    }
//
//    @IBAction func nadeSav(_ sender: Any) { //это вроде сохраняет
//        note![1].setValue("MY NAME !", forKey: "name")
//        do {
//            try note![1].managedObjectContext?.save()
//        } catch {
//            print(error)
//        }
//    }
    /*if CoreDataHandler.deleteObject(note: note![1]) { // удалить 1 объект
     note = CoreDataHandler.fetchObject()
     print("After single delete")
     for i in note! {
     print(i.name!)
     }
     print(note!.count)
     }*/
    
    /*for _ in 0...6 { //насоздавать указанное диапазоном количество объектов
     CoreDataHandler.saveObject(name: String(counter), text: String(counter), creatingDate: date1 as Date, editingDate: date1 as Date)
     counter += 1
     }*/

