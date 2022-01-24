trigger CheckinDateValidation on Contact (before insert) {

  Date today = date.today();
  Contact c = Trigger.New();
  
  if (c.Date_of_checkin__c < today) {
    Trigger.oldMap.get(c.Id).addError(
            'Cannot choose the date in the past.');
  }

}