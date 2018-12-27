import Foundation

protocol DonatePaymentViewModelAbstract: ViewModelAbstract {
    func makeCryptogramPacket(cardNumber: String, andExpDate: String, andCVV: String) -> String?
    
    func charge(cardCryptogramPacket: String,
                cardHolderName: String,
                success: StringCompletion?,
                failure: StringCompletion?,
                d3dsCompletion: D3DSCompletion?)
    
    func auth(cardCryptogramPacket: String,
              cardHolderName: String,
              success: StringCompletion?,
              failure: StringCompletion?,
              d3dsCompletion: D3DSCompletion?)
    
    func post3ds(transactionId: String,
                 paRes: String,
                 success: StringCompletion?,
                 failure: StringCompletion?,
                 d3dsCompletion: D3DSCompletion?)
}
