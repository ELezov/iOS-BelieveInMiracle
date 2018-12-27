#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface D3DS : NSObject 

+(void) make3DSPaymentWithUIViewController: (UIViewController *) viewController andAcsURLString: (NSString *) acsUrlString andPaReqString: (NSString *) paReqString andTransactionIdString: (NSString *) transactionIdString;

@end
