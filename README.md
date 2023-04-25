# SFDC Apex Trigger Framework
@see https://www.xgeek.net/salesforce/a-simple-salesforce-trigger-framework/

<a href="https://githubsfdeploy.herokuapp.com?owner=xgeek-net&repo=sfdc-apex-trigger-framework">
	<img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

Well, this is another Salesforce Trigger framework, but simpler.

## Usage
### AccountTriggerHandler.cls
```java
//This is a sample code for AccountTriggerHandler
public class AccountTriggerHandler extends TriggerHandler {
	public override void beforeInsert() {
		System.debug('AccountTriggerHandler beforeInsert Start');
		
		System.debug('Trigger.isExecuting : ' + isExecuting);
		System.debug('Trigger.isInsert : ' + isInsert);
		System.debug('Trigger.isUpdate : ' + isUpdate);
		System.debug('Trigger.isDelete : ' + isDelete);
		System.debug('Trigger.isBefore : ' + isBefore);
		System.debug('Trigger.isAfter : ' + isAfter);
		System.debug('Trigger.isUndelete : ' + isUndelete);
		System.debug('Trigger.new : ' + newList);
		System.debug('Trigger.newMap : ' + newMap);
		System.debug('Trigger.old : ' + oldList);
		System.debug('Trigger.oldMap : ' + oldMap);
		System.debug('Trigger.size : ' + size);
		
		System.debug('AccountTriggerHandler beforeInsert End');
	}
	
	public override void afterInsert() {
		System.debug('AccountTriggerHandler afterInsert Start');
	}
	
	public override void beforeUpdate() {
		System.debug('AccountTriggerHandler beforeUpdate Start');
	}
	
	public override void afterUpdate() {
		System.debug('AccountTriggerHandler afterUpdate Start');
	}
	
	public override void beforeDelete() {
		System.debug('AccountTriggerHandler beforeDelete Start');
	}
	
	public override void afterDelete() {
		System.debug('AccountTriggerHandler afterDelete Start');
	}
	
	public override void afterUndelete() {
		System.debug('AccountTriggerHandler afterUndelete Start');
	}
}
```
### AccountTrigger.trigger
#### In normal case.
```java
trigger AccountTrigger on Account (before delete, before insert, before update, after delete, after insert, after update, after undelete) {
	TriggerHandlerManager handlerManager = new TriggerHandlerManager();
	handlerManager.add(new AccountTriggerHandler());
	handlerManager.run();
}
```
#### Other cases
Stop and resume sObject Trigger in APEX code
```java
TriggerHandlerManager.stop('CustomObject__c');
TriggerHandlerManager.resume('CustomObject__c');
```
Stop and resume a TriggerHandler in APEX code
```java
TriggerHandlerManager.stop('AccountTriggerHandler');
TriggerHandlerManager.resume('AccountTriggerHandler');
```
