public with sharing class ContactsListWithController {
    @AuraEnabled(cacheable=true)
    
    // generating a list of checked in users from the Contacts, order them by date
    public static List<Contact> getContacts() {
        
        List<Contact> results = [SELECT FirstName, LastName, Id, Date_of_checkin__c FROM Contact WHERE Date_of_checkin__c != null ORDER BY Date_of_checkin__c];

    return results;
    }

    // removing a contact from the list on click
    @AuraEnabled

    public static List<Contact> removeCheckin(String contactId){

        // find the contact
        Contact checkedinUser = [SELECT FirstName, LastName, Id, Date_of_checkin__c FROM Contact WHERE Id=:contactId];
        
        checkedinUser.Date_of_checkin__c = null;
        
        try{
            update checkedinUser;
        }
        catch (Exception e) {
            System.debug('unable to remove contact\'s checking due to' + e.getMessage());
        }

        // once the checkin is removed, we rerender the table 
        return getContacts();
    }
}
