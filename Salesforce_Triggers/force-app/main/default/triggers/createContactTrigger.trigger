Trigger createContactTrigger on Account (After Insert){
	if(Trigger.IsAfter){
        if(Trigger.IsInsert){
			createContactHelper.createContact(Trigger.newMap);
        }
	}
}