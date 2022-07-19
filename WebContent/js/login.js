
function mem_click(mem) {
	var indi_mem = document.getElementById('indi_mem_login_tap');
	var comp_mem = document.getElementById('comp_mem_login_tap');
	var indi_mem_input = document.getElementById('indi_login_content_box');
	var comp_mem_input = document.getElementById('comp_login_content_box');
	if(mem.innerText == '기업회원') {
		indi_mem.classList.remove('check_login_Form_event');
		indi_mem_input.classList.add('check_login_input_event');
		
		mem.classList.add('check_login_Form_event');
		comp_mem_input.classList.remove('check_login_input_event');
		
	}else {
		comp_mem.classList.remove('check_login_Form_event');
		comp_mem_input.classList.add('check_login_input_event');
		
		mem.classList.add('check_login_Form_event');
		indi_mem_input.classList.remove('check_login_input_event');
	}
}
