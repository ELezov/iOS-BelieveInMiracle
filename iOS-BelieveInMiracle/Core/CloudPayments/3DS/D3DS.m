#import "D3DS.h"
#import "AFNetworking/AFNetworking.h"

@interface D3DS (Private)
@end

@implementation D3DS

+(void) make3DSPaymentWithUIViewController: (UIViewController *) viewController andAcsURLString: (NSString *) acsUrlString andPaReqString: (NSString *) paReqString andTransactionIdString: (NSString *) transactionIdString {
    
    NSDictionary *postParameters = @{@"MD": transactionIdString, @"TermUrl": @"http://cloudpayments.ru/", @"PaReq": paReqString};
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST"
                                                                                 URLString:acsUrlString
                                                                                parameters:postParameters
                                                                                     error:nil];
    
    NSHTTPURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&response
                                                             error:&error];
    
    if (([response statusCode] == 200) || ([response statusCode] == 201)) {
        UIWebView *webView=[[UIWebView alloc] initWithFrame:viewController.view.frame];
        webView.delegate = viewController;
        [viewController.view addSubview:webView];
        
        [webView loadData:responseData
                 MIMEType:[response MIMEType]
         textEncodingName:[response textEncodingName]
                  baseURL:[response URL]];
    } else {
        NSString *messageString = [NSString stringWithFormat:@"Unable to load 3DS autorization page.\nStatus code: %d", (unsigned int)[response statusCode]];
        NSLog(@"%@", messageString);
    }
}

@end
