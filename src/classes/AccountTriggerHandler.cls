
public class AccountTriggerHandler extends TriggerHandler{

    public override void beforeInsert(){
    	System.debug( 'AccountTriggerHandler beforeInsert Start' );

    	System.debug( 'Trigger.isExecuting : ' 	+ isExecuting );
    	System.debug( 'Trigger.isInsert : ' 	+ isInsert );
    	System.debug( 'Trigger.isUpdate : ' 	+ isUpdate );
    	System.debug( 'Trigger.isDelete : ' 	+ isDelete );
    	System.debug( 'Trigger.isBefore : ' 	+ isBefore );
    	System.debug( 'Trigger.isAfter : ' 		+ isAfter );
    	System.debug( 'Trigger.isUndelete : ' 	+ isUndelete );
    	System.debug( 'Trigger.new : ' 			+ newList );
    	System.debug( 'Trigger.newMap : ' 		+ newMap );
    	System.debug( 'Trigger.old : ' 			+ oldList );
    	System.debug( 'Trigger.oldMap : ' 		+ oldMap );
    	System.debug( 'Trigger.size : ' 		+ size );

    	System.debug('AccountTriggerHandler beforeInsert End');
    }

    public override void afterInsert(){
    	System.debug('AccountTriggerHandler afterInsert Start');
    }

    public override void beforeUpdate(){
    	System.debug('AccountTriggerHandler beforeUpdate Start');
    }

    public override void afterUpdate(){
    	System.debug('AccountTriggerHandler afterUpdate Start');
    }

    public override void beforeDelete(){
    	System.debug('AccountTriggerHandler beforeDelete Start');
    }

    public override void afterDelete(){
    	System.debug('AccountTriggerHandler afterDelete Start');
    }

    public override void afterUndelete(){
    	System.debug('AccountTriggerHandler afterUndelete Start');
    }
    
}