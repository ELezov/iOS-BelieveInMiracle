//
//  TextFieldView.swift
//  iOS-BelieveInMiracle
//
//  Created by Eugene Lezov on 26.10.2018.
//  Copyright © 2018 Eugene Lezov. All rights reserved.
//

import UIKit
import InputMask

@IBDesignable
class TextFieldView: UIView {
    
    enum MaskType {
        case none
        case phone
        case credtiCard
        case expDate
        case cvv
    }
    
    enum ErrorType: String {
        case phoneError = "Введен некорректный номер"
        case emailError = "Введен некорректный email"
    }
    
    @IBOutlet weak private var textField: SkyFloatingLabelTextField!
    
    
    var dynamicFill: Dynamic<Bool> = Dynamic(false)
    var dynamicChange: Dynamic<String> = Dynamic("")
    var text: String = ""
    var textWithoutMask: String = ""
    
    private var maskFormat: MaskFormat = .none
    private var maskedResult: Mask.Result? {
        didSet {
            textWithoutMask = maskedResult?.extractedValue ?? text
        }
    }
    
    var type: TextFieldType = .text {
        didSet {
            configureMaskType()
        }
    }
    
    var maskType: MaskType = .none {
        didSet {
            configureMaskFormat()
            configureKeyboardType()
            configureMaskHint()
        }
    }
    
    class func setup(configModel: TextFieldViewConfigurationModel) -> TextFieldView? {
        guard let view = TextFieldView.loadFromNib() else { return nil }
        view.configure(configModel: configModel)
        return view
    }
    
    func configure(configModel: TextFieldViewConfigurationModel) {
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        textField.placeholder = configModel.placeholder
        textField.placeholderColor = Color.Base.separator
        textField.title = configModel.placeholder
        textField.titleColor = Color.Text.primaryLight
        textField.selectedTitleColor = Color.Text.primaryLight
        textField.selectedTitle = configModel.placeholder
        textField.lineColor = Color.Base.separator
        textField.selectedLineColor = Color.Base.primaryDark
        
        type = configModel.type
    }
    
    func setText(_ text: String) {
        textField.text = text
        dynamicChange.value = text
        self.text = text
        guard validate(text) else {
            switch type {
            case .mail:
                textField.errorMessage = ErrorType.emailError.rawValue
            case .phone:
                textField.errorMessage = ErrorType.phoneError.rawValue
            default:
                break
            }
            return
        }
        switch type {
        case .text, .mail:
            dynamicFill.value = true
        default:
            break
        }
        textField.errorMessage = ""
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        setText(textField.text ?? "")
    }
    
}

extension TextFieldView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        guard !maskFormat.rawValue.isEmpty else {
            return true
        }
        
        let nsstring = textField.text as NSString?
        guard let newString = nsstring?.replacingCharacters(in: range, with: string) else {
            setText(string)
            return true
        }
        let masked = mask(input: newString, format: maskFormat.rawValue)
    
        setText(masked?.formattedText.string ?? "")
        if let isFilled = masked?.complete {
            maskedResult = masked
            dynamicFill.value = isFilled
        }
        
        if string.isEmpty {
            dynamicFill.value = false
            setText(newString)
        }

        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}

// Mask
fileprivate extension TextFieldView {
    
    enum MaskFormat: String {
        case none       = ""
        case phone      = "+7 ([000]) [000]-[00]-[00]"
        case creditCard = "[0000] [0000] [0000] [0000]"
        case expDate    = "[00]/[00]"
        case cvv        = "[000]"
    }
    
    enum MaskHint: String {
        case none =     ""
        case phone =    "+7 (000) 000-00-00"
    }

    
    func mask(input: String, format: String) -> Mask.Result? {
        if let mask = try? Mask(format: format) {
            let result: Mask.Result = mask
                .apply(toText: CaretString(string: input, caretPosition: input.endIndex),
                       autocomplete: true
            )
            return result
        }
        return nil
    }
    
    func configureMaskType() {
        switch type {
        case .text, .mail:
            maskType = .none
        case .phone:
            maskType = .phone
        case .creditCard:
            maskType = .credtiCard
        case .expDate:
            maskType = .expDate
        case .cvv:
            maskType = .cvv
        }
    }
    
    func configureMaskFormat() {
        switch maskType {
        case .phone:
            maskFormat = .phone
        case .credtiCard:
            maskFormat = .creditCard
        case .expDate:
            maskFormat = .expDate
        case .cvv:
            maskFormat = .cvv
        case .none:
            break
        }
    }
    
    func configureKeyboardType() {
        switch maskType {
        case .phone:
            textField.keyboardType = .phonePad
        case .credtiCard:
            textField.keyboardType = .decimalPad
        case .expDate:
            textField.keyboardType = .decimalPad
        case .cvv:
            textField.keyboardType = .decimalPad
        default:
            break
        }
    }
    
    func configureMaskHint() {
        switch maskType {
        case .phone:
            textField.placeholder = MaskHint.phone.rawValue
        default:
            break
        }
    }
}

extension TextFieldView {
    
    enum RegexType: String {
        case emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case cvvRegex   = "^[0-9]{3,4}$"
        case expDate    = "^[0-9]{2}/[0-9]{2}$"
    }
    
    func validate(_ value: String) -> Bool {
        guard !value.isEmpty else { return false }
        switch type {
        case .text, .phone:
            return true
        case .mail:
            return validate(value, type: .emailRegex)
        case .creditCard:
            return true
        case .cvv:
            return validate(value, type: .cvvRegex)
        case .expDate:
            return validate(value, type: .expDate)
        }
    }
    
    func validate(_ candidate: String, type: RegexType) -> Bool {
        let regex = type.rawValue
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: candidate)
    }
}

struct TextFieldViewConfigurationModel {
    let placeholder: String
    let type: TextFieldType
}

enum TextFieldType {
    case mail
    case phone
    case text
    case creditCard
    case expDate
    case cvv
}
