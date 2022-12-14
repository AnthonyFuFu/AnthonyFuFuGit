/*
 * jQuery blockUI plugin
 * Version 2.70.0-2014.11.23
 * Requires jQuery v1.7 or later
 *
 * Examples at: http://malsup.com/jquery/block/
 * Copyright (c) 2007-2013 M. Alsup
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Thanks to Amir-Hossein Sobhi for some excellent contributions!
 */
(function () {
  function a(b) {
    b.fn._fadeIn = b.fn.fadeIn; var k = b.noop || function () { }; var j = /MSIE/.test(navigator.userAgent);
    var g = /MSIE 6.0/.test(navigator.userAgent) && !/MSIE 8.0/.test(navigator.userAgent); var i = document.documentMode || 0; var p = b.isFunction(document.createElement("div").style.setExpression); b.blockUI = function (r) { h(window, r) }; b.unblockUI = function (r) { n(window, r) };
    b.growlUI = function (x, t, w, v) {
      var r = b('<div class="growlUI"></div>');
      if (x) {
        r.append("<h1>" + x + "</h1>")
      } if (t) {
        r.append("<h2>" + t + "</h2>")
      } if (w === undefined) { w = 3000 } var s = function (y) { y = y || {}; b.blockUI({ message: r, fadeIn: typeof y.fadeIn !== "undefined" ? y.fadeIn : 700, fadeOut: typeof y.fadeOut !== "undefined" ? y.fadeOut : 1000, timeout: typeof y.timeout !== "undefined" ? y.timeout : w, centerY: false, showOverlay: false, onUnblock: v, css: b.blockUI.defaults.growlCSS }) }; s(); var u = r.css("opacity"); r.mouseover(function () { s({ fadeIn: 0, timeout: 30000 }); var y = b(".blockMsg"); y.stop(); y.fadeTo(300, 1) }).mouseout(function () { b(".blockMsg").fadeOut(1000) })
    }; b.fn.block = function (s) { if (this[0] === window) { b.blockUI(s); return this } var r = b.extend({}, b.blockUI.defaults, s || {}); this.each(function () { var t = b(this); if (r.ignoreIfBlocked && t.data("blockUI.isBlocked")) { return } t.unblock({ fadeOut: 0 }) }); return this.each(function () { if (b.css(this, "position") == "static") { this.style.position = "relative"; b(this).data("blockUI.static", true) } this.style.zoom = 1; h(this, s) }) };
    b.fn.unblock = function (r) { if (this[0] === window) { b.unblockUI(r); return this } return this.each(function () { n(this, r) }) };
    b.blockUI.version = 2.7; b.blockUI.defaults = {
      message: "<h1>Please wait...</h1>", title: null, draggable: true, theme: false, css: {
        padding: 0,
        margin: 0,
        width: "30%",
        top: "40%",
        left: "35%",
        textAlign: "center",
        color: "#000",
        border: "3px solid #aaa",
        backgroundColor: "#fff",
        cursor: "wait"
      },
      themedCSS: {
        width: "30%", top: "40%", left: "35%"
      },
      overlayCSS: {
        backgroundColor: "#000",
        opacity: 0.6, cursor: "wait"
      },
      cursorReset: "default",
      growlCSS: {
        width: "350px",
        top: "10px",
        left: "",
        right: "10px",
        border: "none",
        padding: "5px",
        opacity: 0.6, cursor: "default",
        color: "#fff",
        backgroundColor: "#000",
        "-webkit-border-radius": "10px",
        "-moz-border-radius": "10px",
        "border-radius": "10px"
      }, iframeSrc: /^https/i.test(window.location.href || "") ? "javascript:false" : "about:blank",
      forceIframe: false,
      baseZ: 1000,
      centerX: true,
      centerY: true,
      allowBodyStretch: true,
      bindEvents: true,
      constrainTabKey: true,
      fadeIn: 200, fadeOut: 400, timeout: 0, showOverlay: true,
      focusInput: true,
      focusableElements: ":input:enabled:visible",
      onBlock: null,
      onUnblock: null,
      onOverlayClick: null,
      quirksmodeOffsetHack: 4,
      blockMsgClass: "blockMsg",
      ignoreIfBlocked: false
    };
    var l = null; var m = []; function h(A, M) {
      var x, P; var E = (A == window); var K = (M && M.message !== undefined ? M.message : undefined);
      M = b.extend({}, b.blockUI.defaults, M || {});
      if (M.ignoreIfBlocked && b(A).data("blockUI.isBlocked")) { return } M.overlayCSS = b.extend({},
        b.blockUI.defaults.overlayCSS, M.overlayCSS || {});
      x = b.extend({}, b.blockUI.defaults.css, M.css || {});
      if (M.onOverlayClick) { M.overlayCSS.cursor = "pointer" } P = b.extend({}, b.blockUI.defaults.themedCSS, M.themedCSS || {});
      K = K === undefined ? M.message : K;
      if (E && l) { n(window, { fadeOut: 0 }) } if (K && typeof K != "string" && (K.parentNode || K.jquery)) {
        var L = K.jquery ? K[0] : K; var y = {};
        b(A).data("blockUI.history", y); y.el = L; y.parent = L.parentNode; y.display = L.style.display; y.position = L.style.position;
        if (y.parent) { y.parent.removeChild(L) }
      } b(A).data("blockUI.onUnblock", M.onUnblock); var R = M.baseZ;
      var H, I, J, N; if (j || M.forceIframe) {
        H = b('<iframe class="blockUI" style="z-index:' + (R++) + ';display: none;border: none;margin: 0; padding: 0; position: absolute;width: 100 %;height: 100 %;top: 0;left: 0" src="' + M.iframeSrc + '"></iframe>')
      } else {
        H = b('<div class="blockUI" style="display:none"></div>')
      } if (M.theme) {
        I = b('<div class="blockUI blockOverlay ui-widget-overlay" style="z-index:' + (R++) + ';display:none"></div>')
      } else {
        I = b('<div class="blockUI blockOverlay" style="z-index:' + (R++) + ';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>')
      } if (M.theme && E) { N = '<div class="blockUI ' + M.blockMsgClass + ' blockPage ui-dialog ui-widget ui-corner-all" style="z-index:' + (R + 10) + ';display:none;position:fixed">'; if (M.title) { N += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">' + (M.title || "&nbsp;") + "</div>" } N += '<div class="ui-widget-content ui-dialog-content"></div>'; N += "</div>" } else {
        if (M.theme) { N = '<div class="blockUI ' + M.blockMsgClass + ' blockElement ui-dialog ui-widget ui-corner-all" style="z-index:' + (R + 10) + ';display:none;position:absolute">'; if (M.title) { N += '<div class="ui-widget-header ui-dialog-titlebar ui-corner-all blockTitle">' + (M.title || "&nbsp;") + "</div>" } N += '<div class="ui-widget-content ui-dialog-content"></div>'; N += "</div>" } else {
          if (E) {
            N = '<div class="blockUI ' + M.blockMsgClass + ' blockPage" style="z-index:' + (R + 10) + ';display:none;position:fixed"></div>'
          } else {
            N = '<div class="blockUI ' + M.blockMsgClass + ' blockElement" style="z-index:' + (R + 10) + ';display:none;position:absolute"></div>'
          }
        }
      } J = b(N); if (K) { if (M.theme) { J.css(P); J.addClass("ui-widget-content") } else { J.css(x) } } if (!M.theme) { I.css(M.overlayCSS) } I.css("position", E ? "fixed" : "absolute");
      if (j || M.forceIframe) { H.css("opacity", 0) } var G = [H, I, J], r = E ? b("body") : b(A); b.each(G, function () { this.appendTo(r) });
      if (M.theme && M.draggable && b.fn.draggable) { J.draggable({ handle: ".ui-dialog-titlebar", cancel: "li" }) } var B = p && (!b.support.boxModel || b("object,embed", E ? null : A).length > 0); if (g || B) { if (E && M.allowBodyStretch && b.support.boxModel) { b("html,body").css("height", "100%") } if ((g || !b.support.boxModel) && !E) { var O = q(A, "borderTopWidth"), F = q(A, "borderLeftWidth"); var D = O ? "(0 - " + O + ")" : 0; var C = F ? "(0 - " + F + ")" : 0 } b.each(G, function (z, S) { var T = S[0].style; T.position = "absolute"; if (z < 2) { if (E) { T.setExpression("height", "Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.support.boxModel?0:" + M.quirksmodeOffsetHack + ') + "px"') } else { T.setExpression("height", 'this.parentNode.offsetHeight + "px"') } if (E) { T.setExpression("width", 'jQuery.support.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"') } else { T.setExpression("width", 'this.parentNode.offsetWidth + "px"') } if (C) { T.setExpression("left", C) } if (D) { T.setExpression("top", D) } } else { if (M.centerY) { if (E) { T.setExpression("top", '(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"') } T.marginTop = 0 } else { if (!M.centerY && E) { var U = (M.css && M.css.top) ? parseInt(M.css.top, 10) : 0; var t = "((document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + " + U + ') + "px"'; T.setExpression("top", t) } } } }) } if (K) { if (M.theme) { J.find(".ui-widget-content").append(K) } else { J.append(K) } if (K.jquery || K.nodeType) { b(K).show() } } if ((j || M.forceIframe) && M.showOverlay) { H.show() } if (M.fadeIn) { var u = M.onBlock ? M.onBlock : k; var v = (M.showOverlay && !K) ? u : k; var w = K ? u : k; if (M.showOverlay) { I._fadeIn(M.fadeIn, v) } if (K) { J._fadeIn(M.fadeIn, w) } } else { if (M.showOverlay) { I.show() } if (K) { J.show() } if (M.onBlock) { M.onBlock.bind(J)() } } c(1, A, M); if (E) { l = J[0]; m = b(M.focusableElements, l); if (M.focusInput) { setTimeout(e, 20) } } else { d(J[0], M.centerX, M.centerY) } if (M.timeout) { var Q = setTimeout(function () { if (E) { b.unblockUI(M) } else { b(A).unblock(M) } }, M.timeout); b(A).data("blockUI.timeout", Q) }
    } function n(u, x) { var s; var w = (u == window); var r = b(u); var t = r.data("blockUI.history"); var y = r.data("blockUI.timeout"); if (y) { clearTimeout(y); r.removeData("blockUI.timeout") } x = b.extend({}, b.blockUI.defaults, x || {}); c(0, u, x); if (x.onUnblock === null) { x.onUnblock = r.data("blockUI.onUnblock"); r.removeData("blockUI.onUnblock") } var v; if (w) { v = b("body").children().filter(".blockUI").add("body > .blockUI") } else { v = r.find(">.blockUI") } if (x.cursorReset) { if (v.length > 1) { v[1].style.cursor = x.cursorReset } if (v.length > 2) { v[2].style.cursor = x.cursorReset } } if (w) { l = m = null } if (x.fadeOut) { s = v.length; v.stop().fadeOut(x.fadeOut, function () { if (--s === 0) { o(v, t, x, u) } }) } else { o(v, t, x, u) } } function o(x, u, y, v) { var r = b(v); if (r.data("blockUI.isBlocked")) { return } x.each(function (w, A) { if (this.parentNode) { this.parentNode.removeChild(this) } }); if (u && u.el) { u.el.style.display = u.display; u.el.style.position = u.position; u.el.style.cursor = "default"; if (u.parent) { u.parent.appendChild(u.el) } r.removeData("blockUI.history") } if (r.data("blockUI.static")) { r.css("position", "static") } if (typeof y.onUnblock == "function") { y.onUnblock(v, y) } var s = b(document.body), z = s.width(), t = s[0].style.width; s.width(z - 1).width(z); s[0].style.width = t } function c(s, t, w) {
      var v = t == window, r = b(t); if (!s && (v && !l || !v && !r.data("blockUI.isBlocked"))) { return } r.data("blockUI.isBlocked", s); if (!v || !w.bindEvents || (s && !w.showOverlay)) { return } var u = "mousedown mouseup keydown keypress keyup touchstart touchend touchmove"; if (s) { b(document).bind(u, w, f) } else { b(document).unbind(u, f) }
    } function f(s) { if (s.type === "keydown" && s.keyCode && s.keyCode == 9) { if (l && s.data.constrainTabKey) { var t = m; var u = !s.shiftKey && s.target === t[t.length - 1]; var r = s.shiftKey && s.target === t[0]; if (u || r) { setTimeout(function () { e(r) }, 10); return false } } } var v = s.data; var w = b(s.target); if (w.hasClass("blockOverlay") && v.onOverlayClick) { v.onOverlayClick(s) } if (w.parents("div." + v.blockMsgClass).length > 0) { return true } return w.parents().children().filter("div.blockUI").length === 0 } function e(r) { if (!m) { return } var s = m[r === true ? m.length - 1 : 0]; if (s) { s.focus() } } function d(r, A, B) { var v = r.parentNode, w = r.style; var u = ((v.offsetWidth - r.offsetWidth) / 2) - q(v, "borderLeftWidth"); var z = ((v.offsetHeight - r.offsetHeight) / 2) - q(v, "borderTopWidth"); if (A) { w.left = u > 0 ? (u + "px") : "0" } if (B) { w.top = z > 0 ? (z + "px") : "0" } } function q(r, s) { return parseInt(b.css(r, s), 10) || 0 }
  } if (typeof define === "function" && define.amd && define.amd.jQuery) { define(["jquery"], a) } else { a(jQuery) }
})();