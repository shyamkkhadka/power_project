// // Jquery method to convert english date to nepali date
// 
// DateConverter = $.klass({
	// initialize: function(action) {
		// this.action = action;  		// it is from project edit page,project new page while adding OR editing in project new page
	// },
// 	
// 	
	// // popup fancy box and update fields with original values
	// popupBox: function(element,options) {
		// var fancybox_content = $('#answer-field-adder').clone();
		// var clicked_element = $(element);
		// $(fancybox_content).children("p").remove();
		// $(fancybox_content).children("h2").html("<span id='edit-answer-field'>Edit answer field</span>");
		// $($(fancybox_content).find("div.new-field div.left")[0]).html("Field name");
		// $(fancybox_content).find("#add-answer").remove();
// 		
		// if(this.action == "edit_project") {			
			// $(fancybox_content).find("div.spreadsheet-col").remove();
			// $.fancybox(
				// $(fancybox_content).html(),
				// {
					// 'autoDimensions'	: false,
					// 'height'			: 	380,
					// 'width'				: 	549,
					// 'transitionIn'		: 'none',
					// 'transitionOut'		: 'none'
				// }
			// );
// 			
		// }
		// else {
			// $.fancybox(
				// $(fancybox_content).html(),
				// {
					// 'autoDimensions'	: false,
					// 'height'			: 	390,
					// 'width'				: 	549,
					// 'transitionIn'		: 'none',
					// 'transitionOut'		: 'none',
					// 'autoScale'		: false
				// }
			// );
// 				
		// }
// 		
// 		
		// $("#fancybox-inner #worker-result-field-name").val(options["old_name"]);
// 		
		// // Show spreadsheet header field if its from edit form in jobs new page
		// if(this.action == "edit_form") {
			// $("#fancybox-inner #answer-field-name").val(options["spreadsheet_field_name"]);
			// $("#fancybox-inner #worker-result-field-name").bind('keyup', function(){dasherizeText($(this),$("#fancybox-inner #answer-field-name"));});
// 			
		// }
// 		
		// $("#fancybox-inner #answer-field-hint").val(options["hint"]);
		// $("#fancybox-inner select#answer-type").val(options["result_type"]);
		// $("#fancybox-inner").append("<span class='error-message'></span>");
// 
// 
		// $("<a class='small-button blank-a disable' id='update-answer-field-name'>Update Field</a>").insertBefore('#fancybox-inner .field-cancel-button');
// 
		// // Show answer format select box only if it is of the type SLT
		// if(options['result_type'] == "SLT") {
			// $("#fancybox-inner .multiple-choice-container").hide();
			// $("#fancybox-inner div.validator-container").show();
			// $("#fancybox-inner select#format-type").val(options['result_format']);
			// $("#fancybox-inner #duplicate-check").enable();
// 
		// }
		// else if(options['result_type'] == "MLT") {
			// $("#fancybox-inner .multiple-choice-container").hide();
			// $("#fancybox-inner #duplicate-check").enable();
			// $("#fancybox-inner div.validator-container").hide();
		// }
		// else if(options['result_type'] == "MC") {
			// $("#fancybox-inner div.validator-container").hide();
// 
			// var choices = "";
			// $.each(options['result_type_value'].split(","),function(i,v) {
				// choices += '<li><input type="radio" name="multi-choice"/><input type="text" value="'+  decodeURIComponent(v) +'"/><span style="display:none" class="remove-option"><a class="blank-a">Remove</a></span></li>';
			// });
// 
			// $("#fancybox-inner #multiple-options-list").append(choices);
			// $("#fancybox-inner .multiple-choice-container").show();
			// $("#fancybox-inner #duplicate-check").disable();
			// // Adjust height of fancy box
			// $("#fancybox-inner").css({"height":"450px"});
			// $("#fancybox-wrap").css({"height":"470px"});
		// }
// 
		// // Check/uncheck required, no duplicate check boxes
		// var options = options['option'].split(",");
// 
		// if(options[0] == "true") {
			// $("#fancybox-inner #required-check").attr("checked",true);
		// }
		// else {
			// $("#fancybox-inner #required-check").attr("checked",false);
		// }
// 
		// if(options[1] == "true") {
			// $("#fancybox-inner #duplicate-check").attr("checked",false);
		// }
		// else {
			// $("#fancybox-inner #duplicate-check").attr("checked",true);
		// }
// 
		// this.adjustSelectBox();			
		// this.updateFieldName(element,this.action);
		// this.closeFancyBox();
	// },
// 	
	// adjustSelectBox: function() {
		// var action = this.action;
// 		
		// // Initially show answer format 
		// if(this.action == "new") {
			// $("#fancybox-inner .validator-container").show();
			// $("#add-option").hide();
		// }
// 		
 		// $("select#answer-type").live("change",function () {
			// if($(this).val() == "SLT") {
				// $(".multiple-choice-container").hide();
				// $(".validator-container").show();
				// $("#duplicate-check").enable();
// 
				// if(action == "edit_project") {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"380px"});
					// $("#fancybox-wrap").css({"height":"400px"});
				// }
				// else {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"497px"});
					// $("#fancybox-wrap").css({"height":"517px"});
				// }
// 
			// }
// 
			// else if($(this).val() == "MLT") {
				// $(".multiple-choice-container").hide();
				// $(".validator-container").hide();
				// $("#duplicate-check").enable();
// 
				// if(action == "edit_project") {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"380px"});
					// $("#fancybox-wrap").css({"height":"400px"});
				// }
				// else {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"497px"});
					// $("#fancybox-wrap").css({"height":"517px"});
				// }
// 
			// }
// 
			// // For multiple type we need to show options
			// else if($(this).val() == "MC") {
				// // First remove previously loaded li elements
				// $("#multiple-options-list").children().remove();
				// $("#duplicate-check").disable();
// 
				// var choices = '<li><input type="radio" name="multi-choice"/><input type="text"/><span class="field-name-hint">e.g. Option 1 </span><span class="remove-option" style="display:none"><a class="blank-a">Remove</a></span></li>';
				// choices += '<li><input type="radio"  name="multi-choice"/><input type="text"/><span class="field-name-hint">e.g. Option 2 </span><span class="remove-option" style="display:none"><a class="blank-a">Remove</a></span></li>';
				// choices += '<li><input type="radio"  name="multi-choice"/><input type="text"/><span class="field-name-hint">e.g. Option 3 </span><span class="remove-option" style="display:none"><a class="blank-a">Remove</a></span></li>';
				// if($("#multiple-options-list li").length == 0) {
					// $("#fancybox-inner #multiple-options-list").append(choices);
				// }
// 
				// $(".multiple-choice-container").show();
				// $(".validator-container").hide();
// 
				// if(action == "edit_project") {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"470px"});
					// $("#fancybox-wrap").css({"height":"490px"});
				// }
				// else {
					// // Adjust height of fancy box
					// $("#fancybox-inner").css({"height":"560px"});
					// $("#fancybox-wrap").css({"height":"580px"});
				// }
// 
			// }
		// });
	// },
// 	
	// updateFieldName: function(element,from) {
		// var clicked_element = $(element);
		// $("#update-answer-field-name").click(function() {
			// var valid = true; // Flag to check all the validations
// 			
			// // Check that new updated value is not blank
			// if($("#fancybox-inner #worker-result-field-name").val() == "") {
				// valid = false;
				// $("#fancybox-inner .error-message").html("New updated values can't be blank");
			// }
// 			
			// // For multiple option edit, check new option values are not blank
			// if($("#fancybox-inner select#answer-type").val() == "MC") {
				// if($("#fancybox-inner ul#multiple-options-list").children().length >= 2) {
					// $.each($("#fancybox-inner ul#multiple-options-list li input:text"),function(i,v) {
						// if($(v).val() == "") {
							// valid = false;
							// $("#fancybox-inner .error-message").html("New updated option values can't be blank");
						// }
					// });
				// }
				// else {
					// valid = false;
					// $("#fancybox-inner .error-message").html("New updated option values can't be blank");
				// }
			// }
// 			
			// if(valid == true) {
				// // For editing from new project form, change form contents
				// if (from == "edit_project") {
					// var old_name = encodeURIComponent($(clicked_element).parent().siblings("div.left").html());
					// $(clicked_element).parent().siblings("div.left").html($("#fancybox-inner #worker-result-field-name").val());
// 
					// $.each($("#job_worker_result_columns").val().split(","),function(i,v) {
						// if(v == old_name) {
							// var worker_answer_fields = $("#job_worker_result_columns").val().split(",");
							// $("#job_worker_result_columns").val($("#job_worker_result_columns").val().replace(worker_answer_fields[i],encodeURIComponent($("#fancybox-inner #worker-result-field-name").val())));	
// 
							// // Update hint field 
							// var hints = $("#job_result_column_hint").val().split(",");
							// hints[i] = encodeURIComponent($("#fancybox-inner #answer-field-hint").val());
							// $("#job_result_column_hint").val(hints.join(","));	
// 
							// // Update col type
							// var col_types = $("#job_result_type").val().split(",");
							// col_types[i] = encodeURIComponent($("#fancybox-inner #answer-type").val());
							// $("#job_result_type").val(col_types.join(","));
// 
							// // Update answer format
							// var formats = $("#job_result_format").val().split(",");
							// if($("#fancybox-inner select#answer-type").val() == "SLT") {
								// formats[i] = encodeURIComponent($("#fancybox-inner select#format-type").val());
							// }
							// else {
								// formats[i] = "general";
							// }				
							// $("#job_result_format").val(formats.join(","));	
// 							
							// var values = $("#job_result_type_value").val().split(",");
							// // Update options if it is of multiple choice type
							// if($("#fancybox-inner #answer-type").val() == "MC") {
								// var updated_options = [ ];
								// $.each($("#fancybox-inner ul#multiple-options-list input:text"),function(index,value) {
									// updated_options.push(encodeURIComponent($(value).val()));						
								// });
// 
								// values[i] = encodeURIComponent(updated_options);
								// $("#job_result_type_value").val(values.join(","));
							// }
// 							
							// else {
								// values[i] = "none";								
							// }
							// $("#job_result_type_value").val(values.join(","));
							// // Update optional values like required (true/false) and duplicates allowed or not as array
							// var options = $("#job_result_options").val().split(",");
							// var contents = [ ];
							// $.each($("#fancybox-inner #extra-option input:checkbox"),function(i,v) {
								// if($(v).attr("checked") == true) {
									// contents.push("true");
								// }
								// else {
									// contents.push("false");
								// }						
							// });
							// options[i] =  encodeURIComponent(contents);
							// $("#job_result_options").val(options);							
							// $.fancybox.close();	
						// }
					// });
// 
// 					
					// }
// 					
					// // It is from project new page 
					// else {
						// $("#update-answer-field-name").html("Updating..");
						// $("#update-answer-field-name").unbind("click");
// 
						// var params = new Object();
						// params["edit_answer_column"] = true;
// 
						// // Pass col index of the field name in spreadsheet
						// params["col_index"] = $(clicked_element).siblings("div.answer-col-index").html();
// 
						// params["update_value"] = [ ];
						// params["update_value"].push($("#fancybox-inner #answer-field-name").val());
						// params["update_value"].push($("#fancybox-inner #worker-result-field-name").val());
// 						
						// $.ajax({ 
							// url: "/spreadsheets/edit_column", data: params, type: "post", dataType:"json",
							// success: function(responseData) { 
// 
								// $.each($("#job_worker_result_columns").val().split(","),function(i,v) {
									// if(v == encodeURIComponent($(clicked_element).parents("div.field").children("div.form").children("div.answer-field").html())) {
										// updateHiddenFields(clicked_element,i,params["update_value"][1],params["update_value"][0]);
									// }
// 
								// });
// 
								// $(clicked_element).parent().siblings("div.form").children("div.answer-field").html(params["update_value"][1]);			
								// $(clicked_element).siblings("div.worker-answer-field").html(params["update_value"][0]);
							// }
						// });
// 										
					// }
// 					
// 					
				// }
// 				
		// });
// 		
	// },
// 	
	// closeFancyBox: function() {
		// $(".field-cancel-button").click(function() {
			// $.fancybox.close();
		// });
	// } 
// 	
// });
// 
// $(document).ready(function() {
	// // Add options for multiple choice answer type
	// $("#add-option").live('click',function() {
		// $("#fancybox-inner #multiple-options-list").append('<li><input type="radio" name="multi-choice"/><input type="text"/><span style="display:none" class="remove-option"><a class="blank-a">Remove</a></span></li>');
	// });		
// 
	// // Remove options for multiple choice answer type
	// $("#multiple-options-list li span a.blank-a").live('click',function() {
		// if($("#multiple-options-list li").length > 2) {
			// $(this).parents('li').remove();
		// }
		// else {
			// $("div#fancybox-inner div.btn-container").append("<span class='error-message'>Sorry option can't be removed.There should be at least two options </span>");
			// $(".error-message").delay(2500).fadeOut(900, function() {   });
		// }
	// });
// });
// 
// // TODO: Move this function inside class
// function updateHiddenFields(clicked_element,i,updated_worker_value,updated_spreadsheet_value) {
	// // Update worker answer field name
	// var worker_result_fields = $("#job_worker_result_columns").val().split(",");
	// $("#job_worker_result_columns").val($("#job_worker_result_columns").val().replace(worker_result_fields[i],encodeURIComponent(updated_worker_value)));
// 
// 	
	// // Update hint field 
	// var hints = $("#job_result_column_hint").val().split(",");
	// hints[i] = encodeURIComponent($("#fancybox-inner #answer-field-hint").val());
	// $("#job_result_column_hint").val(hints.join(","));	
// 
	// // Update col type
	// var col_types = $("#job_result_type").val().split(",");
	// col_types[i] = encodeURIComponent($("#fancybox-inner #answer-type").val());
	// $("#job_result_type").val(col_types.join(","));	
// 
	// // Update answer format
	// var formats = $("#job_result_format").val().split(",");
	// if($("#fancybox-inner select#answer-type").val() == "SLT") {
		// formats[i] = encodeURIComponent($("#fancybox-inner select#format-type").val());
	// }
	// else {
		// formats[i] = "general";
	// }				
	// $("#job_result_format").val(formats.join(","));	
// 
	// var values = $("#job_result_type_value").val().split(",");	
// 	
	// // Update options if it is of multiple choice type
	// if($("#fancybox-inner #answer-type").val() == "MC") {
		// var updated_options = [ ];
		// $.each($("#fancybox-inner ul#multiple-options-list input:text"),function(index,value) {
			// updated_options.push(encodeURIComponent($(value).val()));						
		// });
// 
		// values[i] = encodeURIComponent(updated_options);
// 				
		// // Update new values in build form as well
		// jQuery.map($(clicked_element).parents("div.field").find("span.multiple-option"), function(v, i) {
			// console.log("New value "+updated_options[i])
			// return ($(v).html(updated_options[i]));
		// });
	// }
// 	
	// // Replace option values as none for SLT,MLT type answer
	// else {
		// values[i] = "none";
	// }
	// $("#job_result_type_value").val(values.join(","));
// 	
	// // Update optional values like required (true/false) and duplicates allowed or not as array
	// var options = $("#job_result_options").val().split(",");
	// var contents = [ ];
	// $.each($("#fancybox-inner #extra-option input:checkbox"),function(i,v) {
		// if($(v).attr("checked") == true) {
			// contents.push("true");
		// }
		// else {
			// contents.push("false");
		// }						
	// });
// 
	// var result_fields = $("#job_result_columns").val().split(",");
	// $("#job_result_columns").val($("#job_result_columns").val().replace(result_fields[i],updated_spreadsheet_value));
// 
// 		
	// options[i] =  encodeURIComponent(contents);
	// $("#job_result_options").val(options);
// 	
	// // Change fields like input, textarea ,radio button shown in the forms
	// var result_type = $("#fancybox-inner #answer-type").val();
	// console.log("Result type "+result_type)
	// switch(result_type)
	// {
		// case "SLT": 
			// $(clicked_element).parent().siblings("div.form").find("div.answer-field").siblings().html('<div class="textbox"><input type="text" disabled="" class="smallInputText"><img src="/images/indicator.gif" class="loading-image" style="display: none;"></div>');
// 			
		// break;
// 		
		// case "MLT": 
			// $(clicked_element).parent().siblings("div.form").find("div.answer-field").siblings().html('<div class="textbox"><textarea disabled="" class="smallTextArea"></textarea><img src="/images/indicator.gif" class="loading-image" style="display: none;"></div>');
		// break;
// 		
		// case "MC": 
			// var contents = '<div class="textbox"><input type="radio" disabled="disabled" name="answer" class="preview-multiple-option">';
			// $.each($("#fancybox-inner ul#multiple-options-list input:text"),function(i,v) {
				// contents += '<span class="multiple-option">'+$(v).val()+'</span><input type="radio" disabled="disabled" name="answer" class="preview-multiple-option">'
// 				
			// });
			// $(clicked_element).parent().siblings("div.form").find("div.answer-field").siblings().html(contents);
		// break;
// 		
		// default:
			// $(clicked_element).parent().siblings("div.form").find("div.answer-field").siblings().html('<div class="textbox"><input type="text" disabled="disabled" class="smallInputText"><img src="/images/indicator.gif" class="loading-image" style="display: none;"></div>');
// 
	// }
// 
	// $.fancybox.close();	
// }
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
