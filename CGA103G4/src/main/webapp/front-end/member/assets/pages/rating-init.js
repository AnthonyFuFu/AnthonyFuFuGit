$(function(){$("input.check").on("change",function(){alert("Rating: "+$(this).val())});$(".rating-tooltip").rating({extendSymbol:function(a){$(this).tooltip({container:"body",placement:"bottom",title:"Rate "+a})}});$(".rating-tooltip-manual").rating({extendSymbol:function(){var a;$(this).tooltip({container:"body",placement:"bottom",trigger:"manual",title:function(){return a}});$(this).on("rating.rateenter",function(b,c){a=c;$(this).tooltip("show")}).on("rating.rateleave",function(){$(this).tooltip("hide")})}});$(".rating").each(function(){$('<span class="badge badge-info"></span>').text($(this).val()||" ").insertAfter(this)});$(".rating").on("change",function(){$(this).next(".badge").text($(this).val())})});