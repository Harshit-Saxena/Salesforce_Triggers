//* Question --> 1. Write a trigger on Account, when an account is inserted, automatically account billing address should populate into the account shipping address.


Trigger Exercise01 on Account (before Insert){
    Exercise01Helper.exercise01(Trigger.new);
}