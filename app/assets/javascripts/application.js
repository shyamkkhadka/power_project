// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.ui.all
//= require jquery.jqGrid.min

$(document).ready(function() {

	// Show Regional Directorate and change accounting offices on changing user role.
	// Called when creating new user
	$("#user_role").change(function() {
		$("#regional_directorates").show();
		$("#account_offices").show();
		listAccOffices($("#regional_directorates option:selected").val(), "user_add");
		$("#station_lists").show();
		listStations($("#account_offistation_regional_directorate_idces option:selected").val(), "user_add");
	});

	// Ajax loading of acc_offices,and stations based on selected regional directorate in user/new page
	$("#regional_directorates").on("change", function() {
		var rd = $("#regional_directorates option:selected").val();
		listAccOffices(rd, "user_add");
	});

	// Ajax loading of station lists, based on selected accounting office in user/new page
	$("#account_offices select.offices").on("change", function() {
		var acc_office = $("#account_offices select.offices option:selected").val();
		var from = "sort_stations";
		listStations(acc_office, from);
	});

	// Observer to display stations overview on click
	// $("#stations_overview img.heading").click(function() {
		// $("#stations_overview div.box").slideToggle('slow');
	// });

// Observer to display battery rack dimensions on click
	$("#stations_overview span.icon").click(function() {
		$("#stations_overview div.box").is(":visible") ? $(this).html("<img src='/assets/arrow-right.png'></img>") : $(this).html("<img src='/assets/arrow-down.png'></img>");
		$("#stations_overview div.box").slideToggle('slow');
	});


	// Display station names in index page, based on selected Regional Directorate
	$("#rd_code").on("change", function() {
		var rd = $("#rd_code option:selected").val();
		$("#stations").load("/stations/list?group_by_rd=" + rd);

		// Change select box containing acc_offices according to selected RD code
		listAccOffices(rd, "stations_index");

	});

	// Ajax loading of stations based on selected accounting office in stations index page
	$("#acc_office").on("change", function() {
		var ofc = $("#acc_office option:selected").val();
		var rd = $("#rd_code option:selected").val();
		$("#stations").load("/stations/list?group_by_rd=" + rd + "&group_by_ofc=" + ofc);
	});

});

// Ajax load accounting offices, depending upon selected regional directorate ,
// and from parameter specifies the view page from which the function is called
function listAccOffices(reg_directorate, from) {
	var params = new Object();
	params["reg_directorate"] = reg_directorate;
	params["from"] = "sort_acc_office";
	$.ajax({
		url : "/accounting_offices",
		data : params,
		type : "get",
		dataType : 'json',
		success : function(responseData) {
			if (from == "station_add") {
				$("#station_accounting_office_id option").remove();
			} else if (from == "user_add") {
				$("#account_offices select.offices option").remove();
			} else if (from == "stations_index") {
				$("#acc_office option").remove();
				$("#acc_office").append("<option value = ALL>ALL</option>");
			}
			$.each(responseData, function(index, element) {
				if (from == "station_add") {
					$("#station_accounting_office_id").append("<option value = " + element.id + ">" + element.name + "</option>");
				} else if (from == "user_add") {
					$("#account_offices").show();
					$("#account_offices select.offices").append("<option value = " + element.id + ">" + element.name + "</option>");
					var acc_office = $("#account_offices select.offices option:selected").val();

					// Ajax loading of stations based on just changed accounting office
					listStations(acc_office, "user_add");

				} else if (from == "stations_index") {
					$("#acc_office").append("<option value = " + element.id + ">" + element.name + "</option>");
				}

			});
		}
	});
}

// Ajax loading of stations based on selected accounting office
function listStations(acc_office, from) {
	console.log("Called " + from);
	var params = new Object();
	params["acc_office"] = acc_office;
	params["from"] = from;

	// Get stations of that accounting office
	$.ajax({
		url : "/stations",
		data : params,
		type : "get",
		dataType : 'json',
		success : function(responseData) {
			$("#station_lists input").remove();
			$("#station_lists span").remove();
			$.each(responseData, function(index, element) {
				$("#station_lists").append('<input type="checkbox" value="' + element.id + '" name="user[station_ids][]" id="user_station_ids_"> <span class="name">' + element.name + '</span>');
			});

		}
	});
}

