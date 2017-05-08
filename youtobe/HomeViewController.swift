//
//  ViewController.swift
//  youtobe
//
//  Created by wanly on 2017/5/4.
//  Copyright © 2017年 ebowin. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
        
        var kanyeChannel = Channel()
        kanyeChannel.name = "KanyeIsTheBastChannel"
        kanyeChannel.profileImageName = "taylor swift4"

        
        var taylorSwiftVideo = Video()
        taylorSwiftVideo.title = "taylor swift"
        taylorSwiftVideo.thumbnailImageName = "beautiful"
        taylorSwiftVideo.channel = kanyeChannel
        taylorSwiftVideo.numberOfViews = 23414325445
        
       var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Tayloy Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor swift1"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 42412345243
        
        var badBloodVideo = Video()
        badBloodVideo.title = "Tayloy Swift - Blank Space"
        badBloodVideo.thumbnailImageName = "taylor swift2"
        badBloodVideo.channel = kanyeChannel
        badBloodVideo.numberOfViews = 53132414563
        
        return [taylorSwiftVideo, blankSpaceVideo, badBloodVideo]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLab = UILabel(frame:CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLab.textColor = UIColor.white
        titleLab.font = UIFont.systemFont(ofSize: 20)
        titleLab.text = "   Home"
        navigationItem.titleView = titleLab
        
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.bounces = false
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        setupMenuBar()
        setupNavBarButtons()
        
       
    }
    
    func setupNavBarButtons() {
        
        ///  withRenderingMode(.alwaysOriginal)   将rightBarItem上面添加的视图的背景颜色改成白色
        let searchImage = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        
        let searchBarButtomItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreImage = UIImage(named: "fenxiang")?.withRenderingMode(.alwaysOriginal)
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButtonItem, searchBarButtomItem]
        
    }
    
 
    lazy var settingsLauncher: SettingsLauncher = {
       let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    func handleMore() {
        // show menu
        settingsLauncher.showSetings()
    }
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewcontroller = UIViewController()
        dummySettingsViewcontroller.view.backgroundColor = UIColor.white
        dummySettingsViewcontroller.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.white
        
        /// 修改titleColor
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        navigationController?.pushViewController(dummySettingsViewcontroller, animated: true)
    }
    
    func handleSearch() {
        print(123)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        
        return mb
    }()
    
    private func setupMenuBar() {
        
        /// 上拉时tabbar自动上拉隐藏
        navigationController?.hidesBarsOnSwipe = true
        
        /// 消除自定义的menuBar和系统自带的bar之间的间隔空间
        let redView = UIView()
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstrainsViewWithFormart(format: "H:|[v0]|", views: redView)
        view.addConstrainsViewWithFormart(format: "V:[v0(50)]", views: redView)
        
        view.addSubview(menuBar)
        view.addConstrainsViewWithFormart(format: "H:|[v0]|", views: menuBar)
        view.addConstrainsViewWithFormart(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}






