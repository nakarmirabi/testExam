//
//  ImageDetailViewController.swift
//  TestExam
//
//  Created by mercantile on 2019-07-04.
//  Copyright © 2019 Rabirb. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageDetailViewController: UIViewController {
    @IBOutlet var imgDetail: UIImageView!
    var imgUrl = [Images]()
    var currentIndex = 0
    
    //MARK: -View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: -UI
    func setupUI() {
        self.title = "Image Detail"
        imgDetail.af_setImage(withURL: URL(string: imgUrl[currentIndex].url!)!)
        setupGesture()
        leftNavBar()
    }
    
    func setupGesture() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //MARK: -Navigation Bar
    func leftNavBar() {
        let back = UIBarButtonItem(image: UIImage(named: "back.png"), style: .plain, target: self, action: #selector(goHome))
        self.navigationItem.leftBarButtonItem  = back
    }
    
    @objc func goHome() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Gesture Action
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                case UISwipeGestureRecognizer.Direction.left:
                    currentIndex += 1
                    if currentIndex >= imgUrl.count {
                        currentIndex = imgUrl.count - 1
                    }
                    self.imgDetail.af_setImage(withURL: URL(string: self.imgUrl[self.currentIndex].url!)!)
                case UISwipeGestureRecognizer.Direction.right:
                    currentIndex -= 1
                    if currentIndex < 0 {
                        currentIndex = 0
                    }
                    imgDetail.af_setImage(withURL: URL(string: imgUrl[currentIndex].url!)!)
                default:
                    break
            }
        }
    }
 
    
    
}
