//
//  SCTransactionService.h
//  Pods
//
//  Created by Jörn Schmidt on 10.04.15.
//
//

#import "SCAbstractService.h"
#import "SCSmartTransaction.h"

@interface SCSmartTransactionService : SCAbstractService

/**
 *  get instance of service
 *
 *  @return the singleton instance
 */
+ (SCSmartTransactionService*)sharedService;

/**
 *  Create a transaction
 *
 *  @param transaction the transaction to create
 *
 *  @return a promise resolveing with a SCSmartTransaction
 */
- (void) createTransaction:(SCSmartTransaction*)transaction completionHandler:(void (^)(SCSmartTransaction *, SecuError *))handler;

/**
 * Updating a transaction.
 *
 * @param transaction The transaction data to update.
 *
 * @return a promise resolveing with SCSmartTransaction
 */
- (void) updateTransaction:(SCSmartTransaction*)transaction completionHandler:(void (^)(SCSmartTransaction *, SecuError *))handler;

/**
 * Starting/Executing a transaction.
 *
 * @param transactionId The transaction id.
 * @param type          The transaction type like "auto" or "cash".
 *
 * @return a promise resolveing with SCSmartTransaction
 */
- (void) startTransaction:(NSString*)transactionId type:(NSString*)type completionHandler:(void (^)(SCSmartTransaction *, SecuError *))handler;

@end
