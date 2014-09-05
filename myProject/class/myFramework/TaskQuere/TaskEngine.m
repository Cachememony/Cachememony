//
//  TaskEngine.m
//  myProject
//
//  Created by book on 14-9-2.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "TaskEngine.h"

@interface InternalTaskQueue : NSObject
@property (nonatomic, retain) NSOperationQueue *taskQueue;
@property (nonatomic, assign) BOOL     isCleanTask;

- (id) initInternalTaskQueue:(NSString*)key
 maxConcurrentOperationCount:(NSInteger)count;

@end

@implementation InternalTaskQueue
@synthesize taskQueue;
@synthesize isCleanTask;

- (id) initInternalTaskQueue:(NSString*)key
 maxConcurrentOperationCount:(NSInteger)count
{
    self = [super init];
    if (self)
    {
        self.isCleanTask = NO;
        self.taskQueue = [[NSOperationQueue alloc]init];
        self.taskQueue.name = key;
        [self.taskQueue setMaxConcurrentOperationCount:1];
    }
    return self;
}

@end



@interface TaskEngine()<TaskEngineProtocol>

@property (nonatomic, retain) NSMutableDictionary *queueDic;


@end



@implementation TaskEngine
@synthesize queueDic;

- (id)init
{
    self = [super init];
    if(self)
    {
        self.queueDic = [[NSMutableDictionary alloc] init];
        [self initQueues];
    }
    return self;
}

- (void)initQueues
{
    [self registerQueue: [self defaultSerialTasksQueueKey]
               isSerail:YES];
    [self registerQueue: [self defualtConcurrentTasksQueueKey]
               isSerail:NO];
    [self registerQueue: [self backgroundSerialTasksQueueKey]
               isSerail:YES];
    [self registerQueue: [self backgroundConcurrentTasksQueueKey]
               isSerail:NO];
}

- (NSString*)defaultSerialTasksQueueKey
{
    return @"default_serial_tasks_queue";
}
- (NSString*)defualtConcurrentTasksQueueKey
{
    return @"default_concurrent_tasks_queue";
}
- (NSString*)backgroundSerialTasksQueueKey
{
    return @"background_serial_tasks_queue";
}
- (NSString*)backgroundConcurrentTasksQueueKey
{
    return @"background_concurrent_tasks_queue";
}



- (void)registerQueue:(NSString*)queuekey
             isSerail:(BOOL)isSerail
{
    InternalTaskQueue *queue = [self.queueDic objectForKey:queuekey];
    if (!queue)
    {
        queue = [[InternalTaskQueue alloc] initInternalTaskQueue:queuekey
                                     maxConcurrentOperationCount:isSerail ? 1 : 5];
        [self.queueDic setObject:queue forKey:queuekey];
        
    }
    else
    {
        //打log
    }
    
}
- (void)unregisterQueue:(NSString*)queuekey
             completion:(EngineTask)completion
{
    [self removeTasksInqueue:queuekey completion:^{
        [self.queueDic removeObjectForKey:queuekey];
        if (completion)
        {
            completion();
        }
        
    }];
    
}

- (void)runTask:(EngineTask)task
        inQueue:(NSString*)queueKey
{
    
    
    
    
    
}

- (void)runTaskWithOperation:(NSOperation*)operation
                     inQueue:(NSString*)queueKey
{
    
}

- (void)removeAllTasks:(EngineTask)completion
{
    
}
- (void)removeTasksInqueue:(NSString*)queueKey
                completion:(EngineTask)completion
{
    
}


@end
