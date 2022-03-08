import consumer from "./consumer";

const initBookingCable = () => {
  const availableTrainersContainer = document.getElementById("available-trainers");
  if (availableTrainersContainer ) {

    consumer.subscriptions.create(
      { channel: "BookingChannel" },
      {
        received(data) {
          availableTrainersContainer.innerHTML = data;
        },
      }
      );
    }
  };

  const initClientCable = () => {
    const bookingRequestsContainer =
      document.getElementById("booking-requests");
    if (bookingRequestsContainer) {
      consumer.subscriptions.create(
        { channel: "BookingChannel" },
        {
          received(data) {
            bookingRequestsContainer.innerHTML = data;
          },
        }
      );
    }
};
export { initBookingCable, initClientCable };
