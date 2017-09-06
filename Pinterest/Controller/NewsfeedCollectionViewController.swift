//
//  NewsfeedCollectionViewController.swift
//  Pinterest
//
//  Created by Eryus Developer on 05/09/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class NewsfeedCollectionViewController : UICollectionViewController
{
    var searchController: UISearchController!
    var posts: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchPosts()
        collectionView?.contentInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    func fetchPosts()
    {
        self.posts = Post.fetchPosts()
        self.collectionView?.reloadData()
    }
}

extension NewsfeedCollectionViewController
{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCollectionViewCell
        cell.post = self.posts?[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "NewsFeedDetailController") as! NewsFeedDetailController
        destination.post = self.posts?[indexPath.item]
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

extension NewsfeedCollectionViewController : PinterestLayoutDelegate
{
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    {
        if let post = posts?[indexPath.item], let photo = post.image {
            let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect = AVMakeRect(aspectRatio: photo.size, insideRect: boundingRect)
            
            return rect.size.height
        }
        
        return 0
    }
    
   
    
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    {
        if let post = posts?[indexPath.item] {
            let topPadding = CGFloat(8)
            let bottomPadding = CGFloat(12)
            let captionFont = UIFont.systemFont(ofSize: 15)
            let captionHeight = self.height(for: post.caption!, with: captionFont, width: width)
            let profileImageHeight = CGFloat(36)
            let height = topPadding + captionHeight + topPadding + profileImageHeight + bottomPadding
            
            return height
        }
        
        return 0.0
    }
    
    func height(for text: String, with font: UIFont, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(64.0)
        let textAttributes = [NSFontAttributeName : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
}















