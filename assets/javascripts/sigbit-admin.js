'use strict';
$(function() {
  $('.inputfile').each(function () {
    var $input = $(this),
    $label = $input.next('label'),
    labelVal = $label.html();

    $input.on('change', function (e) {
      var fileName = '';

      if (this.files && this.files.length > 1)
        fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
      else if (e.target.value)
        fileName = e.target.value.split('\\').pop();

      if (fileName)
        $label.find('span').html(fileName);
      else
        $label.html(labelVal);
    });

    // Firefox bug fix
    $input
      .on('focus', function () { $input.addClass('has-focus'); })
      .on('blur', function () { $input.removeClass('has-focus'); });
  });



  // Sidebar toggle
  $("#sidebar-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });

  // Enable Tooltips
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })

  // Enable Popovers
  $(function () {
    $('[data-toggle="popover"]').popover()
  })

  // Bootstrap button dropdown inside responsive table not visible because of scroll
  // http://stackoverflow.com/questions/26018756/bootstrap-button-drop-down-inside-responsive-table-not-visible-because-of-scroll
  $('body').on('show.bs.dropdown', '.table-responsive', function () { $(this).css("overflow", "visible"); })
    .on('hide.bs.dropdown', '.table-responsive', function () { $(this).css("overflow", "auto"); });

});

