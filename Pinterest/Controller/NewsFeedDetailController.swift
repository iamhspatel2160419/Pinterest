//
//  NewsFeedDetailController.swift
//  Pinterest
//
//  Created by Eryus Developer on 06/09/17.
//  Copyright © 2017 Eryushion Techsol. All rights reserved.
//

import UIKit

class NewsFeedDetailController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var lblPostName: UILabel!
    var post: Post!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblLikes: UILabel!
    @IBOutlet weak var btnPin: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var Description: UILabel!
    var like = 0
    var share = 0
    var comment = 0
    var pin = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NewsFeed Details"
        profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
        profileImage.layer.masksToBounds = true
        postImage.image = post.image
        profileImage.image = post.createdBy.profileImage
        Description.text = post.caption
        lblPostName.text = post.createdBy.username
        lblComment.text = "\(post.numberOfComments!)" + " Comments"
        lblLikes.text = "\(post.numberOfLikes!)" + " Likes"
        if post.isLike == true {
            btnLike.setImage(UIImage(named: "likes"), for: .normal)
            post.isLike = false
        }
        if post.isPin == true {
            btnPin.setImage(UIImage(named: "pin"), for: .normal)
            post.isPin = false
        }
    }
    @IBAction func btnVisit(_ sender: UIButton) {
    }
    @IBAction func btnPin(_ sender: UIButton) {
        if pin == 0 {
            btnPin.setImage(UIImage(named: "pin"), for: .normal)
            post.isPin = false
            pin = 1
        }else {
            btnPin.setImage(UIImage(named: "repin"), for: .normal)
            post.isPin = true
            pin = 0
        }
    }
    @IBAction func btnShare(_ sender: UIButton) {
        if share == 0 {
            btnShare.setImage(UIImage(named: "share"), for: .normal)
            share = 1
        }else {
            btnShare.setImage(UIImage(named: "disShare"), for: .normal)
            share = 0
        }
    }
    @IBAction func btnComment(_ sender: UIButton) {
        if comment == 0 {
            btnComment.setImage(UIImage(named: "comment"), for: .normal)
            comment = 1
        }else {
            btnComment.setImage(UIImage(named: "discomment"), for: .normal)
            comment = 0
        }
    }
    @IBAction func btnLike(_ sender: UIButton) {
        if like == 0 {
            btnLike.setImage(UIImage(named: "likes"), for: .normal)
            post.isLike = false
            like = 1
        }else {
            btnLike.setImage(UIImage(named: "disLikes"), for: .normal)
            post.isLike = true
            like = 0
        }
    }
}
