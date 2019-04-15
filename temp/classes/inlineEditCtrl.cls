public with sharing class inlineEditCtrl {
  
    //method for fetch orders
    @AuraEnabled
    public static List<Order> fetchOrder(Id caseId){
        
       return (List<Order>) [Select id, ordernumber, status, Shipping_Track_Number__c, Shipping_Institution__c, Shipping_Attention__c, TotalAmount from Order where case_id__c = :caseId];
         
    }
    
    @AuraEnabled
    public static List< Order> saveOrder(List<Order> lstOrders) {
            
        if (!Schema.sObjectType.Order.fields.Shipping_Track_Number__c.isUpdateable()){
      		return lstOrders;
    	}
        update lstOrders;
        return lstOrders;
        
    }
    

  // method for fetch picklist values dynamic  
    @AuraEnabled
    public static List < String > getselectOptions(sObject objObject, string fld) {
        system.debug('objObject --->' + objObject);
        system.debug('fld --->' + fld);
        List < String > allOpts = new list < String > ();
        // Get the object type of the SObject.
        Schema.sObjectType objType = objObject.getSObjectType();
        
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        // Get a map of fields for the SObject
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        // Get the list of picklist values for this field.
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
}