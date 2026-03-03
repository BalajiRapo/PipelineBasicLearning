public class MultiPageFormController {

    public String firstName { get; set; }
    public String lastName { get; set; }
    public String email { get; set; }
    public String phone { get; set; }
    public String gender { get; set; }
    public String billingAddress { get; set; }
    public String shippingAddress { get; set; }
    public String selectedCountry1{get;set;}

    // Add additional fields for health information

    public String currentPage { get; set; }
    

 

    public MultiPageFormController() {
        // Initialize properties
        firstName = '';
        lastName = '';
        email = '';
        phone = '';
        billingAddress = '';
        shippingAddress = '';

        // Check for URL parameters to determine the current page
        currentPage = ApexPages.currentPage().getParameters().get('currentPage');
        if (currentPage == null) {
            currentPage = 'page1';
        }
    }

    public PageReference nextPage() {
        // Process and validate data as needed
        // Add your logic to validate data before moving to the next page

        // Navigate to the next page
        navigateToPage('page2');

        return null;
    }
     public PageReference nextPage3() {
        // Process and validate data as needed
        // Add your logic to validate data before moving to the next page

        // Navigate to the next page
        navigateToPage('page3');

        return null;
    }

    public PageReference previousPage() {
        // Navigate to the previous page
        navigateToPage('page1');

        return null;
    }
     public PageReference previousPage3() {
        // Navigate to the previous page
        navigateToPage('page2');

        return null;
    }

    public PageReference submitForm() {
        // Process and save the form data
        // Add your logic to save the data to the database or perform other actions

        // Clear session data
        clearSessionData();

        return null;
    }

    private void clearSessionData() {
        // Clear URL parameters
        PageReference pageRef = ApexPages.currentPage();
        pageRef.getParameters().clear();

        // Clear transient properties
        currentPage = 'page1';
        firstName = '';
        lastName = '';
        email = '';
        phone = '';
        billingAddress = '';
        shippingAddress = '';
    }

    private void navigateToPage(String pageName) {
        // Set the current page URL parameter
        PageReference pageRef = ApexPages.currentPage();
        pageRef.getParameters().put('currentPage', pageName);
        currentPage = pageName;
    }
}