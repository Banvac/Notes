//
//  Data.swift
//  MBNotes
//
//  Created by Stas on 02.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit
import Foundation

var notes:[Note]? = nil

var noteToDetail: Note? = nil
var indexForChangeNote = 0

let currentDate = NSDate() //date
let dateform = DateFormatter()// date


/*    

- Глобальные переменные, их категорически нельзя использовать. Как исправить:

-- класс Data не нужен, убираем

-- для таблицы создаем отдельный класс NotesDataSource в котором теперь будет массив 'var notes = [Note]()' и он а не контроллер реализует протоколы UITableViewDelegate и UITableViewDataSource, там же можно инициализировать форматтер для дат

-- indexForChangeNote тоже не особо нужен, достаточно научить DetailNoteViewController принимать на вход объект Note (который у Вас noteToDetail) и действие которое надо сделать когда пользователь сохраняет изменения этого объекта, то есть начало выглядеть будет так:

```

class DetailNoteViewController: UIViewController {
    
    @IBOutlet weak var noteNameLblDN: UITextField!
    
    @IBOutlet weak var textNoteDN: UITextView!
    
    @IBOutlet weak var creationDateLblDN: UILabel!
    
    @IBOutlet weak var editingDateLblDN: UILabel!
    
    
    
    var currentNote: Note?
    
    var onSaveAction: ((Note) -> Void)?
    
    ```
    
    и в saveChangeBtnDN останется только выполнить это действие (само действие лучше установить извне при навигации на контроллер)*/
