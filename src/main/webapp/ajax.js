$(document).ready(function() {
            $('#table').change(function ()
            {
            	//alert("hello1");
                $.ajax({
                    type: "post",
                    url: "gettabledata.jsp", 
                    data: "table="+$('#table').val()+"&user="+$('#user').val()+"&pass="+$('#pass').val()+"&dbname="+$('#dbname').val(),
                    success: function(msg){   
                    	//alert(msg);
                            $('#columns').html(msg);
                    },
                    error:function(msg){
                    	alert("error1"+msg)
                    }
                });
            });
            $('#plot').click(function ()
                    {
                    	//alert("hello1");
                        $.ajax({
                            type: "post",
                            url: "plot.jsp", 
                            data: "table="+$('#table').val()+"&user="+$('#user').val()+"&pass="+$('#pass').val()+"&dbname="+$('#dbname').val()+"&table="+$('#table').val()+"&column1="+$('#column1').val()+"&column2="+$('#column2').val()+"&graph_type="+$('#graph_type').val(),
                            success: function(msg){   
                            	//alert(msg);
                                    $('#graph_area').html(msg);
                            },
                            error:function(msg){
                            	alert("error1"+msg)
                            }
                        });
                    });

        




});