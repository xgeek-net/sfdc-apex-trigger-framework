trigger AccountTrigger on Account (before delete, before insert, before update, 
                                    after delete, after insert, after update,
                                  after Undelete) {
	TriggerHandlerManager handlerManager = new TriggerHandlerManager();
    handlerManager.add( new AccountTriggerHandler() );
    handlerManager.run();
    //TriggerHandlerManager.stop( 'AccountTriggerHandler' );
    //TriggerHandlerManager.resume( 'AccountTriggerHandler' );
}