//
//  NewsFeedSourceCell.swift
//  WorkExercise1
//
//  Created by dan baharir on 01/11/2017.
//

import Foundation
import UIKit

class NewsFeedASourceCell: UICollectionViewCell {
    
    @IBOutlet weak var titleBackgroundView: UIView!
    @IBOutlet weak var sourceTitle: UILabel!
    var feedSource:FeedSource!
    
    // set cell selected bg color.
    override var isSelected: Bool {
        didSet {
            self.titleBackgroundView.backgroundColor = isSelected ? AppColor.CollectionViewCell.SelectedBackground : AppColor.CollectionViewCell.NotSelectedBackground
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.feedSource = FeedSource()
        self.isSelected = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCell(source:FeedSource?) {
        if source != nil {
            feedSource = source
            self.sourceTitle.text = feedSource.sourceData.name
        }
    }
}
