({
    requiredValidation : function(component,event) {
        // get all accounts.. 	
        var allRecords = component.get("v.OrderList");
        var isValid = true;
        
        // play a for loop on all account list and check that account name is not null,   
        for(var i = 0; i < allRecords.length;i++){
            if(allRecords[i].Shipping_Track_Number__c.length > 16){
                alert('Complete this field : Row No ' + (i+1) + ' Tracking Number must have 16 characters' );
                isValid = false;
            }  
        }
        return isValid;
    },
})