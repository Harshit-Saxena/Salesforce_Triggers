trigger UpdateChildByParent on Account (After Update) {
    if(trigger.isAfter &&  trigger.isUpdate) {
        UpdateChildByParentHandler.ContactUpdate(Trigger.new);
    }
}