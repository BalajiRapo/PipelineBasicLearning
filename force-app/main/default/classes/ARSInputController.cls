public class ARSInputController {
  public Account acc { get; set; }

  public ARSInputController() {
    acc = new Account();
  }

  public void saveAccount() {
    insert acc;
    acc = new Account(); // Clear the fields after saving
  }
}