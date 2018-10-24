import SnapKit
import UIKit

class ActionButton: UIButton {
    
    enum Status {
        case enabled
        case disabled
    }
    
    enum Style {
        case filled
        case blank
    }
    
    var status: Status = .enabled {
        didSet { configureView() }
    }
    
    var style: Style = .filled {
        didSet { configureView() }
    }
    
    // MARK: - Инициализация
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // MARK: - Interface Builder
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configure()
    }
    
    // MARK: - Приватные методы
    /**
     Конфигурация кнопки.
     */
    private func configure() {
        layer.cornerRadius = 12
        configureView()
    }
    
    private func configureView() {
        isUserInteractionEnabled = status == .enabled
        switch (style, status) {
        case (.filled, .enabled):
            setTitleColor(UIColor(Color.textPrimaryInverse), for: .normal)
            backgroundColor = UIColor(Color.primaryDark)
        case (.filled, .disabled):
            setTitleColor(UIColor(Color.textPrimaryLight), for: .normal)
            backgroundColor = UIColor(Color.primaryLight)
        case (.blank, .enabled):
            setTitleColor(UIColor(Color.textPrimaryInverse), for: .normal)
            backgroundColor = UIColor(Color.textPrimaryLight)
            layer.borderWidth = 1
            layer.borderColor = UIColor(Color.primaryDark).cgColor
        case (.blank, .disabled):
            setTitleColor(UIColor(Color.textPrimaryLight), for: .normal)
            backgroundColor = UIColor(Color.primaryDark)
            layer.borderWidth = 1
            layer.borderColor = UIColor(Color.primaryDark).cgColor
        }
    }
}
