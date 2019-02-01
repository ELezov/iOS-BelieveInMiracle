//
//  PagingTableManager.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 11/01/2019.
//  Copyright © 2019 Eugene Lezov. All rights reserved.
//

import Foundation

typealias TablePaginable = TableManagerable & Paginable & TableManagerApendable

protocol Paginable {
    var shouldShowLoading: Bool { get set }
    var onPagingEvent: EmptyCompletion? { get set }
    
    var loadingVM: CellViewModel { get set }
}

class PagingTableManager: BaseTableManager, Paginable {
    
    var loadingVM: CellViewModel = LoadingCellViewModel()
    
    var onPagingEvent: EmptyCompletion?
    var shouldShowLoading: Bool = false
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = items[section].count
        return shouldShowLoading ? count + 1 : count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoadingIndexPath(indexPath) {
            return tableView.dequeueReusableCell(withModel: loadingVM, for: indexPath)
        } else {
             return tableView.dequeueReusableCell(withModel: items[indexPath.section][indexPath.row], for: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if
            isLoadingIndexPath(indexPath),
            let loadVM = loadingVM as? CellViewModelHeightable {
            return loadVM.height
        }
        guard let items = items[indexPath.section][indexPath.row] as? CellViewModelHeightable else {
            return UITableViewAutomaticDimension
        }
        return items.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard isLoadingIndexPath(indexPath) else { return }
        onPagingEvent?()
    }
    
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoading else { return false }
        return indexPath.row == items[indexPath.section].count
    }
}
