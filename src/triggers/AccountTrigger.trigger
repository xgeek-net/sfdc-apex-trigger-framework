trigger AccountTrigger on Account (before delete, before insert, before update, 
                                    after delete, after insert, after update,
                                  after Undelete) {

  //TriggerHandlerManager.stop( 'CustomObject__c' );
  //TriggerHandlerManager.resume( 'CustomObject__c' );
  TriggerHandlerManager handlerManager = new TriggerHandlerManager();
  handlerManager.add( new AccountTriggerHandler() );
  handlerManager.run();
  //TriggerHandlerManager.stop( 'AccountTriggerHandler' );
  //TriggerHandlerManager.resume( 'AccountTriggerHandler' );
}