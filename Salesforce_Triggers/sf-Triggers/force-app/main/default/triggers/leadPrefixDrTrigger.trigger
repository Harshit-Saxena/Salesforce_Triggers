Trigger leadPrefixDrTrigger on Lead (Before insert, Before Update) {
    if(Trigger.IsBefore &&(Trigger.IsInsert || Trigger.IsUpdate) ){
        leadPrefixDrCls.leadPrefixDr(Trigger.new);
    }
}