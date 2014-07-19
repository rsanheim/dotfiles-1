$("button.mark-all-as-read").parent().prepend('<button class="box-action mute-all-unread css-truncate tooltipped upwards" original-title="mute all unread notifications"> <span class="octicon octicon-mute"></span> </button>');

$('button.mute-all-unread').click(function(event) {
  // mute all unread notifications
  $(this).parent().parent().parent().find('li.unread').find('.js-mute-notification button').click();
  return false;
}); 
