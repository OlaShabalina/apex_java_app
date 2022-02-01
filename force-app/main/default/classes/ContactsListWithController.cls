public with sharing class ContactsListWithController {
    @AuraEnabled(cacheable=true)
    
    // generating a list of checked in users from the Contacts, order them by date
    public static List<Contact> getContacts() {
        
        List<Contact> results = [SELECT FirstName, LastName, Id, Date_of_checkin__c FROM Contact WHERE Date_of_checkin__c != null ORDER BY Date_of_checkin__c];

    return results;
    }
}
