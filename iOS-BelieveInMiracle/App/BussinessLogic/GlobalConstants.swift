import Foundation

enum GlobalConstants {
    
    enum Base {
        static let baseURL = "https://www.deti39.com/wp-json/wp/v2"
    }

    static let smsCodeForDonate = "7715"
    static let donateLink = "https://www.deti39.com/monthly_donation/#.XJ5FJ-szbBJ"
    
    static let mailForVolunteer = "deti39v@mail.ru"
    
    // Payment
    static let merchantPulicId = "test_api_00000000000000000000002" // Test host
    // Не храните пароль для API в приложении!
    static let merchantApiPass = "50dfb1df0cb5c84528e9d3772f7ce04e" // Test host
    
    static let cloudpaymentsURL = "http://cloudpayments.ru/"
    
    enum Social {
        enum App {
            static let vk = "vk://vk.com/deti39"
            static let instagram = "instagram://user?username=deti39"
        }
        enum Browser {
            static let vk = "https://vk.com/deti39"
            static let facebook = "https://www.facebook.com/veruvchudo39"
            static let instagram = "https://www.instagram.com/deti39/"
            
        }

    }
}
