//
//  XGSwitchFontSizeController.m
//  XGCustomCamera
//
//  Created by 小果 on 2016/12/9.
//  Copyright © 2016年 小果. All rights reserved.
//

#import "XGSwitchFontSizeController.h"

@interface XGSwitchFontSizeController ()@end
@implementation XGSwitchFontSizeController{
    NSArray *_sizeArray;
}
-(void)setupUI{
    _sizeArray = @[@6,@8,@9,@10,@11,@12,@14,@16,@18,@20,@22,@24];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sizeArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_sizeArray[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:^{
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        for (UILabel *bgV in cell.contentView.subviews) {
            if ([bgV isKindOfClass:[UILabel class]]) {
                _xg_FontSize([bgV.text integerValue]);
            }
        }
    }];
}

@end
