//
//  ScrollView.swift
//  BookReader
//
//  Created by gejiangs on 16/6/16.
//  Copyright © 2016年 gejiangs. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


public enum BannerPageAlign : Int {
    
    case none
    case left
    case center
    case right
}


class BannerScrollView: UIView, UIScrollViewDelegate {

    fileprivate var scrollView:UIScrollView?                //滚动view
    var pageControl:UIPageControl?                      //pageView
    fileprivate var imageNameArray:NSArray?                 //本地图片数组
    fileprivate var imageUrlStringArray:NSArray?            //网络图片数组
    fileprivate var imagesArray:NSArray?                    //图片数组
    fileprivate var _pageAlign:BannerPageAlign = .none      //page对齐方式
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        initUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI()
    {
        self.scrollView = UIScrollView(frame: self.bounds);
        scrollView?.isPagingEnabled = true
        scrollView?.delegate = self
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.showsVerticalScrollIndicator = false
        self.addSubview(self.scrollView!);
        
        self.pageControl = UIPageControl();
        self.addSubview(self.pageControl!);
        self.pageAlign = .center
    }
    
    //MARK:设置图片
    /**
     设置网络图片url
     
     - parameter urls: 图片url数组
     */
    func setImageUrls(_ urls:NSArray)
    {
        self.imageUrlStringArray = urls;
        self.imageNameArray = nil;
        self.imagesArray = nil;
        
        self.addImageViews()
    }
    
    /**
     设置本地图片
     
     - parameter imageNames: 本地图片名数组
     */
    func setImageNames(_ imageNames:NSArray)
    {
        self.imageNameArray = imageNames;
        self.imageUrlStringArray = nil;
        self.imagesArray = nil;
        
        self.addImageViews()
    }
    
    /**
     设置图片
     
     - parameter images: 图片image数组
     */
    func setImages(_ images:NSArray)
    {
        self.imagesArray = images;
        self.imageNameArray = nil;
        self.imageUrlStringArray = nil;
        
        self.addImageViews()
    }
    
    /**
     清除原先图片
     */
    fileprivate func clearImageViews()  {
        for view in (self.scrollView?.subviews)! {
            view.removeFromSuperview()
        }
    }
    
    /**
     添加图片
     */
    fileprivate func addImageViews()
    {
        self.clearImageViews();
        var imageCount = 0;
        if self.imageNameArray?.count > 0 {
            imageCount = (self.imageNameArray?.count)!
        }else if self.imageUrlStringArray?.count > 0
        {
            imageCount = (self.imageUrlStringArray?.count)!
        }else if self.imagesArray?.count > 0
        {
            imageCount = (self.imagesArray?.count)!
        }
        
        for i in 0 ..< imageCount {
            let imageView = UIImageView();
            if self.imageNameArray?.count > 0 {
                imageView.image = UIImage(named: self.imageNameArray![i] as! String);
            }else if self.imageUrlStringArray?.count > 0
            {
                
            }else if self.imagesArray?.count > 0
            {
                imageView.image = self.imagesArray![i] as? UIImage
            }
            let x = self.frame.size.width * CGFloat(i);
            imageView.frame = CGRect(origin: CGPoint(x:x, y:0), size: self.bounds.size)
            self.scrollView?.addSubview(imageView)
        }
        var contentSize = self.bounds.size;
        contentSize.width = contentSize.width * CGFloat(imageCount);
        
        scrollView?.contentSize = contentSize
        pageControl?.numberOfPages = imageCount
    }
    
    
    //MARK: 设置page对齐方式
    internal var pageAlign:BannerPageAlign{
        get{
            return _pageAlign
        }
        set(align){
            _pageAlign = align
            self.resetPageControllerAlign()
        }
    }
    
    /**
     重新设置page对齐方式
     */
    fileprivate func resetPageControllerAlign()
    {
        pageControl?.isHidden = pageAlign == .none;
        switch pageAlign {
        case .left:
            pageControl?.frame = CGRect(x: 10, y: self.frame.size.height-20, width: 100, height: 20);
            break
        case .center:
            pageControl?.frame = CGRect(x: (self.frame.size.width - 100)/2, y: self.frame.size.height-20, width: 100, height: 20);
            break
        case .right:
            pageControl?.frame = CGRect(x: self.frame.size.width - 100, y: self.frame.size.height-20, width: 100, height: 20);
            break
        default:
            break
        }
    }
    
    //MARK:UIScrollView Delegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = NSInteger(scrollView.contentOffset.x/scrollView.frame.size.width);
        
        pageControl?.currentPage = currentPage
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
