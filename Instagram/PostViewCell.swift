//
//  PostViewCell.swift
//  Instagram
//
//  Created by Sylvia Mach on 3/13/17.
//  Copyright © 2017 Sylvia Mach. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostViewCell: UITableViewCell {
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var instagramPost: PFObject!  {
        didSet{
            captionLabel.text = instagramPost["caption"] as? String
            photoView.file = instagramPost["media"] as? PFFile
            photoView.loadInBackground()
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
