//------------------ 게시글 메뉴

(function (global, $) {
  var pluginName = "accordion";

  function Accordion($selector, options) {
    this.$selector = $selector;
    this.config = $.extend({}, this._defaults, options || {});
    this.detect = {
      children: this.$selector.find(
        this.config.descendant.ul + ", " + this.config.descendant.div
      ),
      clickTarget:
        "." + this.$selector.attr("class") + " " + this.config.eventTarget,
    };
    this._init();
  }
  Accordion.prototype = {
    _defaults: {
      descendant: {
        ul: "ul",
        div: "li > div",
      },
      dataValue: "accordiated",
      className: "active",
      eventTarget: "a",
    },
    _init: function () {
      if (!this.$selector.length) return;
      this._menuInit();
      this._initEvent();
    },
    _menuInit: function () {
      var _self = this;
      if (this.$selector.data(this.config.dataValue)) return false;
      $.each(this.detect.children, function () {
        var $this = $(this);
        _self.$selector.data(_self.config.dataValue, true);
        $this.hide();
      });
    },
    _initEvent: function () {
      $(document).on(
        "click.acc.ck",
        this.detect.clickTarget,
        $.proxy(this._activate, this)
      );
      this._hashCheck();
    },
    _activate: function (e) {
      var $this = $(e.target);
      $this
        .parent("li")
        .toggleClass(this.config.className)
        .siblings()
        .removeClass(this.config.className)
        .children(this.config.descendant.ul + ", " + this.config.descendant.div)
        .slideUp("fast");
      this._effect($this);
    },
    _effect: function (el, effect) {
      $(el)
        .siblings(this.config.descendant.ul + ", " + this.config.descendant.div)
        [effect || "slideToggle"](!effect ? "fast" : null);
    },
    _hashCheck: function () {
      var hash = location.hash
        ? this.$selector.find('a[href="' + location.hash + '"]')[0]
        : "";
      if (hash) {
        this._effect(hash, "toggle");
        if (this.$selector) {
          $(hash).parents("ul").show();
        }
      }
    },
  };

  $.fn[pluginName] =
    $.fn[pluginName] ||
    function (options) {
      var $this = this;
      return $.each($this, function (idx, el) {
        var $selector = $this.eq(idx);
        if (!$.data(this, "plugin_" + pluginName)) {
          $.data(
            this,
            "plugin_" + pluginName,
            new Accordion($selector, options)
          );
        }
        return $selector;
      });
    };
})(window, window.jQuery);

$(function () {
  $(".menuBox").accordion();
});
