/**
 * http통신관련
 */

	
	function ComSubmit(formId){
		this.formId = gfn_isNull(formId) ? "commonForm" : formId;
		this.url ="";
		
		if( this.formId == "commonForm" ){
			$("#commonForm").empty();
		}
		
		this.setUrl = function setUrl(url){
            this.url = url;
            
		}
		
		this.addParam = function addParam(key, value){
			$("#"+this.formId).append("<input type='hidden' name='"+key+"' value='"+value+"'  />");
		}
		
		this.submit = function submit(){
			var frm = $("#"+this.formId)[0];
			frm.action = this.url;
			frm.method = "post";
			frm.submit();
			
		}
		
	}
	
	
	
	gfv_callBackFunction ="";
	function CommAjax(formId){
		this.formId = gfn_isNull(formId) ? "commonForm" : formId;
		this.url = "";
		this.params = "";
		this.callBackFunction = "123";
		
		
		if( this.formId == "commonForm" ){
			$("#commonForm").empty();
		}
		
		this.setUrl = function setUrl(url){
			this.url = url;
		}
		
		this.addParam = function addParam(key,value){
			this.params += "&"+ key +"="+ value;
		}
		
		this.setCallBack = function setCallBack(callback){
			gfv_callBackFunction = callback;	
		}
		
		this.ajax = function ajax(){
			if( this.formId != "commonForm"){
				this.params += "&"+$("#"+formId).serialize();
			}
			//alert(this instanceof CommAjax); true
			$.ajax({
				url : this.url,
				data : this.params,
				type : "POST",
				/*async : false,*/
				success : function(data, status){
					// ajax통신후에는 this의값이 달라진다
					//alert(this instanceof CommAjax); false
					eval(gfv_callBackFunction+"(data);");
				}
			});
		}
	}	
	
