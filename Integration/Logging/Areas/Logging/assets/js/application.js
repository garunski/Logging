$(function() {

	var table = $('#example').dataTable({
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"sDom": '<""f>t<"F"lp>'
	});


	var onSampleResized = function(e) {
		var columns = $(e.currentTarget).find("th");
		var msg = "columns widths: ";
		columns.each(function() { msg += $(this).width() + "px; "; });
	};

	$(".resize").colResizable({
		liveDrag: true,
		gripInnerHtml: "<div class='grip'></div>",
		draggingClass: "dragging",
		onResize: onSampleResized
	});

	$.fn.simpleTabs = function() {

		//Default Action
		$(this).find(".tab_content").hide(); //Hide all content
		$(this).find("ul.tabs li:first").addClass("activeTab").show(); //Activate first tab
		$(this).find(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {
			$(this).parent().parent().find("ul.tabs li").removeClass("activeTab"); //Remove any "active" class
			$(this).addClass("activeTab"); //Add "active" class to selected tab
			$(this).parent().parent().find(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
			$(activeTab).show(); //Fade in the active content
			return false;
		});
	};

	$("div[class^='widget']").simpleTabs();

	$("input").each(
		function() {
			if ($(this).val() == "" && $(this).attr("placeholder") != "") {
				$(this).val($(this).attr("placeholder"));
				$(this).focus(function() {
					if ($(this).val() == $(this).attr("placeholder")) $(this).val("");
				});
				$(this).blur(function() {
					if ($(this).val() == "") $(this).val($(this).attr("placeholder"));
				});
			}
		});


	$(function() {
		var sin = [], cos = [];
		for (var i = 0; i < 21; i += 0.5) {
			sin.push([i, Math.sin(i)]);
			cos.push([i, Math.cos(i)]);
		}

		var plot = $.plot($(".chart"),
			[{ data: sin, label: "sin(x)" }, { data: cos, label: "cos(x)" }], {
				series: {
					lines: { show: true },
					points: { show: true }
				},
				grid: { hoverable: true, clickable: true },
				yaxis: { min: -1.1, max: 1.1 },
				xaxis: { min: 0, max: 20 }
			});

		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css({
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #000',
				padding: '2px',
				'z-index': '9999',
				'background-color': '#202020',
				'color': '#fff',
				'font-size': '11px',
				opacity: 0.8
			}).appendTo("body").fadeIn(200);
		}

		var previousPoint = null;
		$(".chart").bind("plothover", function(event, pos, item) {
			$("#x").text(pos.x.toFixed(2));
			$("#y").text(pos.y.toFixed(2));

			if ($("#enableTooltip:checked").length > 0) {
				if (item) {
					if (previousPoint != item.dataIndex) {
						previousPoint = item.dataIndex;

						$("#tooltip").remove();
						var x = item.datapoint[0].toFixed(2),
						    y = item.datapoint[1].toFixed(2);

						showTooltip(item.pageX, item.pageY,
							item.series.label + " of " + x + " = " + y);
					}
				} else {
					$("#tooltip").remove();
					previousPoint = null;
				}
			}
		});

		$(".chart").bind("plotclick", function(event, pos, item) {
			if (item) {
				$("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
				plot.highlight(item.series, item.datapoint);
			}
		});
	});


	/* Lines with autodrowing */

	$(function() {
		// we use an inline data source in the example, usually data would
		// be fetched from a server
		var data = [], totalPoints = 200;

		function getRandomData() {
			if (data.length > 0)
				data = data.slice(1);

			// do a random walk
			while (data.length < totalPoints) {
				var prev = data.length > 0 ? data[data.length - 1] : 50;
				var y = prev + Math.random() * 10 - 5;
				if (y < 0)
					y = 0;
				if (y > 100)
					y = 100;
				data.push(y);
			}

			// zip the generated y values with the x values
			var res = [];
			for (var i = 0; i < data.length; ++i)
				res.push([i, data[i]]);
			return res;
		}

		// setup control widget
		var updateInterval = 1000;
		$("#updateInterval").val(updateInterval).change(function() {
			var v = $(this).val();
			if (v && !isNaN(+v)) {
				updateInterval = +v;
				if (updateInterval < 1)
					updateInterval = 1;
				if (updateInterval > 2000)
					updateInterval = 2000;
				$(this).val("" + updateInterval);
			}
		});

		// setup plot
		var options = {
			yaxis: { min: 0, max: 100 },
			xaxis: { min: 0, max: 100 },
			colors: ["#afd8f8"],
			series: {
				lines: {
					lineWidth: 2,
					fill: true,
					fillColor: { colors: [{ opacity: 0.1 }, { opacity: 0.2 }] },
					//"#dcecf9"
					steps: false
				}
			}
		};
		var plot = $.plot($(".autoUpdate"), [getRandomData()], options);

		function update() {
			plot.setData([getRandomData()]);
			// since the axes don't change, we don't need to call plot.setupGrid()
			plot.draw();

			setTimeout(update, updateInterval);
		}

		update();
	});

});