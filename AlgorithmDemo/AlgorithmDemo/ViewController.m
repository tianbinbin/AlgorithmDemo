//
//  ViewController.m
//  AlgorithmDemo
//
//  Created by 田彬彬 on 2017/6/18.
//  Copyright © 2017年 田彬彬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * dataArr = [NSMutableArray arrayWithArray:@[@"13",@"5",@"89",@"20",@"40",@"18",@"120"]];
    // 算法
    // 1. 冒泡排序
    /**  冒泡排序的特点
     *   我们取出第一个数 和 第二个数 将最小的数 赋给第一个数 然后让第二个数与 第三个数比较 将最小的数 赋给 第二个数 然后依次类推
     *   第一轮下来我们就获取到了最大的数  第二轮就从第二个数开始 我们就获取到了第二个比较大的数 通过循环就可以实现 升序
     */
    for(int i = 0 ;i<dataArr.count;i++){
    
        for(int j = 0; j< dataArr.count-1-i;j++){
        
            if([dataArr[j] integerValue]>[dataArr[j+1] integerValue]){
            
                NSString * temp = dataArr[j];
                dataArr[j] = dataArr[j+1];
                dataArr[j+1] = temp;
            }
        }
    }
    
    NSLog(@"冒泡排序之后数组的顺序--%@",dataArr);
    
    
    // 2. 选择排序
    /**   选择排序的特点
     *    我们取出第一个数 然后让它与剩下的数一一比较 那么一轮下来 我们就能确定最小值
     */
    
    NSMutableArray * selectArr = [NSMutableArray arrayWithArray:@[@"13",@"5",@"89",@"20",@"40",@"18",@"120"]];
    
    for(int i=0;i<selectArr.count-1;i++){
    
        for(int j = i+1;j<selectArr.count;j++){
            
            if([selectArr[i] integerValue]>[selectArr[j] integerValue]){
            
                NSString * temp = selectArr[i];
                selectArr[i] = selectArr[j];
                selectArr[j] = temp;
            }
        }
    }
    
   NSLog(@"选择排序之后数组的顺序--%@",selectArr);
    
    // 3. 插入排序
   /**   插入排序的特点
    *    第一步我们取出第二数 然后让 第二个数与第一个数比较 如果 第二个数< 第一个数  那么我们就将数组第二个数的位子换成第一个数的值 然后 j--
    */
    NSMutableArray * insertArr = [NSMutableArray arrayWithArray:@[@"13",@"5",@"89",@"20",@"40",@"18",@"120"]];
    
    for(int i =1;i<insertArr.count;i++){
        
        int j = i;
        
        NSString * temp = insertArr[i];
        
        while (j>0&&[temp integerValue] < [insertArr[j-1] integerValue]) {
         
            [insertArr replaceObjectAtIndex:j withObject:insertArr[j-1]];
            j--;
        }
        
        [insertArr replaceObjectAtIndex:j withObject:temp];
    }
    
    NSLog(@"插入排序最终结果---%@",insertArr);
    
    //4. 希尔排序
    /**  希尔排序的特点
     *   类似于对半查找 但又不一样  这个不常用。了解就行了
     */
    NSMutableArray * hillArr = [NSMutableArray arrayWithArray:@[@"13",@"5",@"89",@"20",@"40",@"18",@"120"]];

    int gap = hillArr.count/2.0;
    
    while (gap>=1) {
        
        for(int i = gap ;i< hillArr.count;i++){
            
            NSString * temp  = hillArr[i];
            int j = i;
            while (j>gap && [temp integerValue]<[hillArr[j-gap] integerValue]) {
              
                [hillArr replaceObjectAtIndex:j withObject:hillArr[j-gap]];
                j-=gap;
            }
            [hillArr replaceObjectAtIndex:j withObject:temp];
        }
        gap = gap/2;
    }
    
    NSLog(@"希尔排序最终结果---%@",insertArr);
    
    
    //5. 二分查找
    /**  二分查找的特点。这个蛮重要的有些面试的话 会问到
     *   二分查找有一个特点那就是这个数组一定是排序好多的 不论是升序 还是降序 都一定排好了
     */
    NSArray * erFenArr = @[@"5",@"13",@"20",@"80",@"87",@"100",@"120"];
    NSLog(@"二分查找最终输出的值--%ld",(long)[self TB_erFenCheckWithlow:0 Andhight:erFenArr.count AndArr:erFenArr AndSelctID:@"80"]);
    
    //6. 快排
    /**  快排 这个也蛮重要的 面试的话有可能会问
     */
    NSMutableArray * kuaipaiArr = [NSMutableArray arrayWithArray:@[@"13",@"5",@"89",@"20",@"40",@"18",@"120"]];
    
    [self TB_KuaipaiWithArr:kuaipaiArr low:0 hight:kuaipaiArr.count-1];
    
     NSLog(@"快速排序最终结果---%@",kuaipaiArr);
    
}


// 二分查找
-(NSInteger )TB_erFenCheckWithlow:(NSInteger)low Andhight:(NSInteger)hight AndArr:(NSArray *)arr AndSelctID:(NSString *)key{

    if(low<hight){
    
        NSInteger  mid = (low + hight)/2;
        
        if([key integerValue] == [arr[mid] integerValue])
        {
            return  mid;
        }
        else if ([key integerValue] < [arr[mid] integerValue])
        {
            return [self TB_erFenCheckWithlow:low Andhight:mid-1 AndArr:arr AndSelctID:key];
        }
        else
        {
            return [self TB_erFenCheckWithlow:mid+1 Andhight:hight AndArr:arr AndSelctID:key];
        }
    }else{
    
        NSLog(@"参数错误");
        return -1;
    }
}

// 快排
-(void)TB_KuaipaiWithArr:(NSMutableArray *)kuaipaiarr low:(NSInteger)low hight:(NSInteger)hight{

    if(low>=hight) return;

    
    NSInteger i = low;
    NSInteger j = hight;
    NSString * temp = kuaipaiarr[low];
    
    while (i<j) {
        
        while (i<j &&[temp integerValue]<=[kuaipaiarr[j] integerValue]) {
            j--;
        }
        
        kuaipaiarr[i] = kuaipaiarr[j];
        
        while (i<j&& [temp integerValue]>=[kuaipaiarr[i] integerValue]) {
            i++;
        }
        
        kuaipaiarr[j] = kuaipaiarr[i];
    }
    
    kuaipaiarr[i] = temp;
    
    [self TB_KuaipaiWithArr:kuaipaiarr low:low hight:i-1];
    [self TB_KuaipaiWithArr:kuaipaiarr low:i+1 hight:hight];
}


@end
