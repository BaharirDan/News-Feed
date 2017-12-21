//
//  NewsFeedSourcesCell.swift
//  WorkExercise1
//
//  Created by dan baharir on 01/11/2017.
//

import Foundation
import UIKit

class NewsFeedSourcesCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var sources:[FeedSource]!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.sources = []
    }
    
    func setCell(sources:[FeedSource]?) {
        if sources == nil {
            return
        }
        self.sources = sources
    }
    
    ////
    // UICollectionViewController Delegate Methods
    ////
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sources != nil ? self.sources.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppStoryBoard.Idetifiers.Cells.CollectionViewCells.NewsFeedArticleCell, for: indexPath as IndexPath) as? NewsFeedASourceCell
        if cell == nil {
            cell = NewsFeedASourceCell()
        }
        
        cell?.setCell(source: self.sources[indexPath.item])
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: AppLayout.CollectionView.Cell.NewsFeedSourceWidth, height: AppLayout.CollectionView.Cell.NewsFeedSourceHeight);
    }}
