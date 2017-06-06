$(document).ready(function() {
            $('#table').onchange(function ()
            {
                $.ajax({
                    type: "post",
                    url: "gettabledata.jsp", //this is my servlet
                    data: "input="+$('#table').val(),
                    success: function(msg){      
                            $('#columns').innerHTML(msg);
                    }
                });
            });

        




});