Trigger leadPrefixDrTrigger on Lead (Before insert, Before Update) {
    if(Trigger.IsBefore ){
        if(Trigger.IsInsert || Trigger.IsUpdate){
            leadPrefixDrCls.leadPrefixDr(Trigger.new);
        }
    }
}