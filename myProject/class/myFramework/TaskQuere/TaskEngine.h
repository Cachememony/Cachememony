//
//  TaskEngine.h
//  myProject
//
//  Created by book on 14-9-2.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^EngineTask)();

@protocol TaskEngineProtocol <NSObject>

- (NSString*)defaultSerialTasksQueueKey;
- (NSString*)defualtConcurrentTasksQueueKey;
- (NSString*)backgroundSerialTasksQueueKey;
- (NSString*)backgroundConcurrentTasksQueueKey;

- (void)registerQueue:(NSString*)queuekey
             isSerail:(BOOL)isSerail;
- (void)unregisterQueue:(NSString*)queuekey
            completion:(EngineTask)completion;

- (void)runTask:(EngineTask)task
        inQueue:(NSString*)queueKey;

- (void)runTaskWithOperation:(NSOperation*)operation
                     inQueue:(NSString*)queueKey;

- (void)removeAllTasks:(EngineTask)completion;
- (void)removeTasksInqueue:(NSString*)queueKey
                completion:(EngineTask)completion;


@end


@interface TaskEngine : NSObject

@end
