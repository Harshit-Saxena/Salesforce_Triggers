// ? 2. Write a trigger on the Account when the Account is updated check all opportunities related to the account. Update all Opportunities Stage to close lost if an opportunity created date is greater than 30 days from today and stage not equal to close won.

Trigger Exercise02Trigger on Account (After Update) {
    Exercise02Helper.exercise02(Trigger.new);
}