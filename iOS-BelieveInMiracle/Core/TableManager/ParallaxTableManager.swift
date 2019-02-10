//
//  ParallaxTableManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 06/02/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

typealias TableParallaxable = TableManagerable & TableManagerApendable & TableManagerParallaxable

protocol TableManagerParallaxable {
    var parallaxHeight: CGFloat { get set }
    var imageUrl: String? { get set }
    var onChangeAlpha: ((CGFloat) -> Void)? { get set }
}

class ParallaxTableManager: BaseTableManager, TableManagerParallaxable {
    
    var imageUrl: String? {
        didSet {
            configureImageHeader()
        }
    }
    
    
    enum Constants {
        static let defaultHeightNavBar: CGFloat = 44.0
        static let defaultHeightSafeArea: CGFloat = 20.0
        static let defaultDiffBottom: CGFloat = 100.0
    }
    
    var parallaxHeight: CGFloat = 0 {
        didSet {
            configureImageHeader()
        }
    }
    
    var topHeight: CGFloat {
        var height: CGFloat = Constants.defaultHeightNavBar
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top ?? Constants.defaultHeightSafeArea
            height += topPadding
        }
        return height
    }
    
    var onChangeAlpha: ((CGFloat) -> Void)?
    
    var imageView: UIImageView?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withModel: items[indexPath.section][indexPath.row], for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let items = items[indexPath.section][indexPath.row] as? CellViewModelHeightable else {
            return UITableViewAutomaticDimension
        }
        return items.height
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = parallaxHeight - (scrollView.contentOffset.y + parallaxHeight)
        let height = min(max(yPosition, topHeight),
                         parallaxHeight + Constants.defaultDiffBottom)
        
        let alpha = 1 - CGFloat((height - topHeight) / (parallaxHeight - topHeight))
        onChangeAlpha?(alpha)
        changeImageHeight(height)
    }
    
}

fileprivate extension ParallaxTableManager {
    
    func configureImageHeader() {
        imageView = UIImageView()
        imageView?.frame = CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.size.width,
                                  height: parallaxHeight)
        if let urlString = imageUrl,
            let urlStringPercent = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlStringPercent) {
            imageView?.kf.setImage(with: url)
        }
        imageView?.contentMode = .scaleAspectFill
        imageView?.clipsToBounds = true
        guard let imgView = imageView else { return }
        let view = UIView()
        view.addSubview(imgView)
        tableView?.backgroundView = view
        
        tableView?.contentInset = UIEdgeInsets(top: parallaxHeight,
                                               left: 0,
                                               bottom: 0,
                                               right: 0)
    }
    
    func changeImageHeight(_ height: CGFloat) {
        imageView?.frame = CGRect(x: 0,
                                  y: 0,
                                  width: UIScreen.main.bounds.size.width,
                                  height: height)
    }
}
