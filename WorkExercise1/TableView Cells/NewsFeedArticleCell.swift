//
//  NewsFeedArticleCell.swift
//  WorkExercise1
//
//  Created by dan baharir on 01/11/2017.
//

import UIKit
import SDWebImage

class NewsFeedArticleCell: UITableViewCell {
    
    var article:Article!
    
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articleHeadlineLabel: UILabel!
    @IBOutlet weak var cellLeftView: UIView!
    @IBOutlet weak var cellRightView: UIView!
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.article = Article.init()
    }
    
    func setCell(article:Article?) {
        if article == nil {
            return
        }
        self.article = article
        self.articleAuthorLabel.text = self.article.articleData.author
        self.articleHeadlineLabel.text = self.article.articleData.title
        self.articleDescriptionLabel.text = self.article.articleData.description
        self.articleImageView.sd_setShowActivityIndicatorView(true)
        
        // display activity indicator while loading image.
        self.articleImageView.sd_setIndicatorStyle(.whiteLarge)

        // get image from url async on background thread using SDWebImage framework.
        self.articleImageView.sd_setImage(with: self.article?.articleData.urlToImage) { (image, error, cache, urls) in
            
            // remove activity indicator when image loading completes.
            self.articleImageView.sd_setShowActivityIndicatorView(false)
            if (error != nil) {
                
                // Failed to load image
                self.articleImageView.image = UIImage(named: AppAssetName.Image.ImageNotAvailable)
            } else {
                
                // Successful in loading image
                self.articleImageView.image = image
            }
        }
    }
}
