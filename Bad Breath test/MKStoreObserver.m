//
//  MKStoreObserver.m
//
//  Created by Mugunth Kumar on 17-Oct-09.
//  Copyright 2009 Mugunth Kumar. All rights reserved.
//

#import "MKStoreObserver.h"
#import "MKStoreManager.h"
#import "AppDelegate.h"
#import "ViewController.h"
@implementation MKStoreObserver

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				
                [self completeTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateFailed:
				
//                if (transaction.error.code == SKErrorPaymentCancelled){
//                    if(DEBUG) NSLog(@"Transaction failed => Payment cancelled.");
//                }else if (transaction.error.code == SKErrorPaymentInvalid){
//                    if(DEBUG) NSLog(@"Transaction failed => Payment invalid.");
//                }else if (transaction.error.code == SKErrorPaymentNotAllowed){
//                    if(DEBUG) NSLog(@"Transaction failed => Payment not allowed.");
//                }else if (transaction.error.code == SKErrorClientInvalid){
//                    if(DEBUG) NSLog(@"Transaction failed => client invalid.");
//                }else if (transaction.error.code == SKErrorUnknown){
//                    if(DEBUG) NSLog(@"Transaction failed => unknown error.");
//                }else{
//                    if(DEBUG) NSLog(@"I have no idea.");
//                }

                [self failedTransaction:transaction];
				
                break;
				
            case SKPaymentTransactionStateRestored:
				
                [self restoreTransaction:transaction];
				
            default:
				
                break;
		}			
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{

    if (transaction.error.code != SKErrorPaymentCancelled){	
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The upgrade procedure failed" message:@"Please check your Internet connection and your App Store account information." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];
		//[alert release];
	}	
	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
    
}

- (void) completeTransaction: (SKPaymentTransaction *)transaction
{		
    [[MKStoreManager sharedManager] provideContent: transaction.payment.productIdentifier];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    //Need to call Mint Game From Here
    ViewController* temp =  [[ViewController alloc]init];
    [temp MintMiniLaunch];
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{	
    [[MKStoreManager sharedManager] provideContent: transaction.originalTransaction.payment.productIdentifier];	
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];	
}

@end
