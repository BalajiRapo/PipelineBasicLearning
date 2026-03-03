public class AsyncExample {
    @future(callout=true) // 'callout=true' if making HTTP callouts
    public static void performAsyncTask(List<Id> recordIds) {
        // Long-running logic here
        System.debug('Processing: ' + recordIds);
    }
}