/**
 * Copyright (c) 2012, Xgeek.net, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the Xgeek.net, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

public class TriggerHandlerManager{

	private List<TriggerHandler> handlerList = new List<TriggerHandler>();

	private static Map<String, Boolean> handlerLockMap = new Map<String, Boolean>();
    
    /**
     * Add a TriggerHandler
     * @param TriggerHandler handler
     */
    public void add( TriggerHandler handler ) {

    	handlerList.add( handler );
    }

    /**
     * Run Trigger Handlers
     */
    public void run() {

    	if( handlerList.isEmpty() ) return;

    	for( TriggerHandler handler : handlerList ) {

    		//TriggerHandler has been locked.
    		if( isHandlerLock( handler.getName() ) ) continue;
            //sObject Trigger has been locked.
            if( isHandlerLock( handler.getObjectName() ) ) continue;

    		if( Trigger.isBefore && Trigger.isInsert ) {
    			handler.beforeInsert();
    		} else if( Trigger.isBefore && Trigger.isUpdate ) {
    			handler.beforeUpdate();
    		} else if( Trigger.isBefore && Trigger.isDelete ) {
    			handler.beforeDelete();
    		} else if( Trigger.isAfter && Trigger.isInsert ) {
    			handler.afterInsert();
    		} else if( Trigger.isAfter && Trigger.isUpdate ) {
    			handler.afterUpdate();
    		} else if( Trigger.isAfter && Trigger.isDelete ) {
    			handler.afterDelete();
    		} else if( Trigger.isAfter && Trigger.isUndelete ) {
    			handler.afterUndelete();
    		}
    	}
    }

    /**
     * Stop a TriggerHandler
     * @param  String TriggerHandler class name
     * @return none
     */
    public static void stop( String handlerName ) {
    	
    	handlerLockMap.put( handlerName, true );
    }
    /**
     * Resume a TriggerHandler
     * @param  String TriggerHandler class name
     * @return none
     */
    public static void resume( String handlerName ) {

    	handlerLockMap.put( handlerName, false );
    }

    //TriggerHandler or sObject is locked
    private Boolean isHandlerLock( String handlerName ) {

    	if( !handlerLockMap.containsKey( handlerName ) ) return false;

    	Boolean isLock = handlerLockMap.get( handlerName );
    	return isLock;
    }

}