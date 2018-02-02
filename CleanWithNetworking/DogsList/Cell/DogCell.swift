//
//  DogCell.swift
//  CleanWithNetworking
//
//  Created by EightSquare on 2/1/18.
//  Copyright © 2018 EightSquare. All rights reserved.
//

import UIKit

class DogCell: UITableViewCell {
    static let identifier = String(describing: DogCell.self)
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(title:String, subtitle:String){
        self.lblTitle.text = title
        self.lblSubtitle.text = subtitle
    }
}
