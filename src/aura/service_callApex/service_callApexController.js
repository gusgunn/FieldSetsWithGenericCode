({
//service_callApex controller
   onCallApex : function(component, event, helper) {
        //get the method parameters - NOTE arguments is a key word for this and you can't use any other word
        var params = event.getParams().arguments;
        var callerComponent = params.component;
        var controllerMethod = params.controllerMethod;
        var actionParameters = params.actionParameters;
        var successCallback = params.successCallback;
        helper.callApex(callerComponent, controllerMethod, actionParameters, successCallback);
	},
})