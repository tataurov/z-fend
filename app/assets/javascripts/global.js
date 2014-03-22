
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
        $("img.lazy").lazyload({
            threshold : 200

        });
    }
    self.load = function() {
       init();
    }
    return self;
}(app.modules.leftNav || {}));