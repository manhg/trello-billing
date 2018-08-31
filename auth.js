var authenticationSuccess = function() {
    app = new window.TrelloBilling();
    app.start();
};

var authenticationFailure = function() {
  console.log('Failed authentication');
};

window.Trello.authorize({
  type: 'popup',
  name: 'Trello Data',
  scope: {
    read: 'true',
    write: 'false' },
  expiration: 'never',
  success: authenticationSuccess,
  error: authenticationFailure
});