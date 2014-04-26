
// Модуль левого меню

app.modules.leftNav = (function(self) {
    var $pageBody = $('#js-page-body');

    function addEvents() {
        $('#js-left-nav').mouseenter(function() {
            $(this).addClass('active');
            $pageBody.addClass('active');
        }).mouseleave(function() {
            $(this).removeClass('active');
            $pageBody.removeClass('active');
        });
    }
    self.load = function() {
        addEvents();
    }
    return self;
}(app.modules.leftNav || {}));

app.modules.lazyLoad = (function(self) {
    function init() {
        $("img.lazy").show().lazyload({
            threshold : 200
        });
    }
    self.ready = function() {
       init();
    }
    return self;
}(app.modules.leftNav || {}));

app.modules.forms = (function(self) {
    function init() {
      $doc.on('focus', '.field-with-error input', function() {

        var
          $this = $(this),
          $error = $this.closest('.field-with-error').find('.error-');

        $this.closest('.field-with-error').removeClass('field-with-error');
        $error.slideUp(300, function() {
          $error.remove();
        });
      });

      $('.js-date-picker').datepicker({
        dateFormat: 'dd-mm-yy'
      });

    }

    self.ready = function() {
       init();
    }
    return self;
}(app.modules.forms || {}));