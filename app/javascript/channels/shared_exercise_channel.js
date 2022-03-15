import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.sharedExerciseId;

    consumer.subscriptions.create({ channel: "SharedExerciseChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('afterbegin', data)
      },
    });
  }
}

export { initChatroomCable };
