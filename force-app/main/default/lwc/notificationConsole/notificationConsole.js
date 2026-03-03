import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { subscribe, unsubscribe, onError } from "lightning/empApi";

export default class NotificationConsole extends LightningElement {
  notifications = [];
  subscription = null;

  // Method to handle incoming platform events
  handleNotificationEvent(event) {
    console.dir(event);
    // Parse event data
    const id = event.data.event.replayId;
    const message = event.data.payload.Message__c;
    const utcDate = new Date(event.data.payload.CreatedDate);
    const time = `${utcDate.getMinutes()}:${utcDate.getSeconds()}`;

    // Add notification to the UI
    const notification = {
      id,
      message,
      time,
    };
    this.notifications.push(notification);

    // Show a toast message
    this.dispatchEvent(
      new ShowToastEvent({
        variant: "info",
        title: "New Notification",
        message: message,
      })
    );
  }

  // Lifecycle hook to subscribe to platform events
  async connectedCallback() {
    // Configure default error handler for EMP API
    onError((error) => {
      this.dispatchEvent(
        new ShowToastEvent({
          variant: "error",
          title: "EMP API Error",
          message: "Check the developer console for more details.",
        })
      );
      console.error("EMP API error:", JSON.stringify(error));
    });

    // Subscribe to the Notification__e platform event
    this.subscription = await subscribe(
      "/event/Notification__e",
      -1,
      (event) => this.handleNotificationEvent(event)
    );

    // Notify the user that the subscription is successful
    this.dispatchEvent(
      new ShowToastEvent({
        variant: "success",
        title: "Subscription Successful",
        message: "Ready to receive notifications",
      })
    );
  }

  // Lifecycle hook to unsubscribe when the component is removed
  disconnectedCallback() {
    unsubscribe(this.subscription).catch((error) =>
      console.error("Error unsubscribing:", error)
    );
  }
}