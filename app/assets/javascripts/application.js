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

$(document).ready(function() {
	
	// Ajax load accounting offices, depending upon selected regional directorate  
	$("#station_regional_directorate_id").change(function() {
			var reg_directorate = $("#station_regional_directorate_id option:selected").val();
			var params = new Object();
			params["reg_directorate"] = reg_directorate;
			params["from"] = "sort_acc_office";
			var reg_directorate = $("#station_regional_directorate_id option:selected").val();

			$.ajax({ 
							url: "/accounting_offices", data: params, type: "get",  dataType:'json',
							success: function(responseData) {
							
								var acc_office = [];
								for( var i=0; i<responseData.length; i++ ) {
									acc_office.push(responseData[i].name);
								}
								$("#station_accounting_office_id option").remove();
								$.each(acc_office, function(i,v) {
										$("#station_accounting_office_id").append("<option>"+v+"</option>")
								});

			       }
				});	
  });

});


