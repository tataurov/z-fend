

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