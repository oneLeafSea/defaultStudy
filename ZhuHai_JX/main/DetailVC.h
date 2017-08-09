//
//  DetailVC.h
//  ZhuHaiJx
//
//  Created by 冯学仕 on 17/7/31.
//  Copyright © 2017年 rooten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhDataInfo.h"

@protocol DetailVCDelegate;
@interface DetailVC : UITableViewController

@property (nonatomic, retain) ZhDataInfo *detai_ZhInfo;
@property (nonatomic, weak) id <DetailVCDelegate> detailVC_delegate;

@end

@protocol DetailVCDelegate <NSObject>

- (void) detailVCHasUpdataDataAndNotificateMainVCToAlsoUpdataData;

- (void) deleteBtntappedWithZhdataInfo:(ZhDataInfo *)zhdataInfo;

@end
