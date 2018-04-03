//
//  NoteTableViewCell.swift
//  MBNotes
//
//  Created by Stas on 02.04.18.
//  Copyright © 2018 StanislavEgorov. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    //connect content
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var noteNameLbl: UILabel!
    @IBOutlet weak var noteCreateDateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
