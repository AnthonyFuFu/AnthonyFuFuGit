!function (a) {
  var b = function () { };
  b.prototype.initNavbar = function () {
    a(".navbar-toggle").on("click", function (c) {
      a(this).toggleClass("open");
      a("#navigation").slideToggle(400)
    });
    a(".navigation-menu>li").slice(-1).addClass("last-elements");
    a('.navigation-menu li.has-submenu a[href="#"]').on("click", function (c) {
      if (a(window).width() < 992) {
        c.preventDefault();
        a(this).parent("li").toggleClass("open").find(".submenu:first").toggleClass("open")
      }
    })
  }, b.prototype.initLoader = function () {
    a(window).load(function () {
      a("#status").fadeOut();
      a("#preloader").delay(350).fadeOut("slow"); a("body").delay(350).css({ overflow: "visible" })
    })
  }, b.prototype.initNicescroll = function () {
    a(".niceScrollleft").niceScroll({ height: "auto", position: "right", scrollspeed: 40, cursorcolor: "#ddd", cursorwidth: "8px", })
  };
  b.prototype.initMenuItem = function () {
    a(".navigation-menu a").each(function () {
      if (this.href == window.location.href) {
        a(this).parent().addClass("active");
        a(this).parent().parent().parent().addClass("active"); a(this).parent().parent().parent().parent().parent().addClass("active")
      }
    })
  },
    b.prototype.initComponents = function () { a('[data-toggle="tooltip"]').tooltip(); a('[data-toggle="popover"]').popover() },
    b.prototype.initToggleSearch = function () {
      a(".toggle-search").on("click", function () { var d = a(this).data("target"); var c; if (d) { c = a(d); c.toggleClass("open") } })
    },
    b.prototype.init = function () { this.initNavbar(); this.initLoader(); this.initNicescroll(); this.initMenuItem(); this.initComponents(); this.initToggleSearch() },
    a.MainApp = new b, a.MainApp.Constructor = b
}(window.jQuery),
  function (a) { a.MainApp.init() }(window.jQuery);