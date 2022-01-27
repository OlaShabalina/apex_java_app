trigger ContactTrigger on Contact (before insert) {

  ContactTriggerHandler.beforeInsert(Trigger.New);

}