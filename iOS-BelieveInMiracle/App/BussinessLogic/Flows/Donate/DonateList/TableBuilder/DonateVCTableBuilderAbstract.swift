protocol DonateVCTableBuilderAbstract {
    /// Create view models
    ///
    func map(_ completionSelect: @escaping DonateItemListCellViewModel.OnClick) -> [CellViewModel]
}
