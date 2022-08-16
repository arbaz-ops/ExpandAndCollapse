//
//  CustomTableViewCell.swift
//  ExpandAndCollase
//
//  Created by Carbonic-IT on 16/08/2022.
//

import UIKit

protocol Delegate {
    func expandTapped(indexPath: IndexPath)
}

class CustomTableViewCell: UITableViewCell {
    var delegate: Delegate?
    @IBOutlet weak var cellDescriptionLabel: UILabel!
    var indexPath: IndexPath?
    @IBOutlet weak var cellNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellDescriptionLabel.text = "Loremsadkhjskjahdjksahdjkhsakjdhsajkhdkjashdjkashdkjshajkdhsjkahdkjsahkdjshajkdhskjahdkjsahdkjsahkjdhaskjdhkjsahdkjsahkjdhsajkdhskjahdkjsahdkjhsakjdhskjahdkjsahdkjsahjkdhsakjhdksajhdkjashjkdhas"
    }

    @IBAction func expandButtonTapped(_ sender: UIButton) {
        self.delegate?.expandTapped(indexPath: self.indexPath!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(expanded: Bool) {
        if expanded {
            self.frame.size.height = 101
        }
        else {
            self.frame.size.height = 101 / 2
        }
    }
    
}
