public class FileDisplayController {

    // List to store the files
    public List<ContentVersion> fileList { get; set; }

    public FileDisplayController() {
        // Query ContentVersion records
        fileList = [SELECT Id, Title, VersionData FROM ContentVersion];
    }
}