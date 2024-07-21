<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body onload="fun2()">
	
	<div class="row">
	<h1 class="alert alert-info">Ajax First Example</h1>
            <div class="col-sm-6">
                <form>
                
                <div class="mb-3">
                    <input class="form-control bg-info" type="email" id="email" placeholder="Email:">
                </div>
                <div class="mb-3">
                    <input class="form-control bg-primary" type="password" id="password" placeholder="Password:">
                </div>
                <div class="mb-3">
                    <input  class="form-control bg-warning" type="tel" id="phone" placeholder="Phone:">
                </div>
                <div class="mb-3">
                    <textarea class="form-control bg-success" name="address" id="address" placeholder="Address:"></textarea>
                </div>
                <div class="mb-3">
                    <button class="btn btn-primary" onclick="fun1()">Register</button>
                    <button class="btn btn-danger" >Reset</button>
                </div>
            </form>
            </div>
            <div class="col-sm-6">
			    <table id="responseTable" class="table table-hover">
    		    </table>
            </div>
	</div>
</body>
</html>
<script>
	function fun2()
	{
		let xhtr=new XMLHttpRequest();
        xhtr.open("GET","getUsers.jsp");
        xhtr.onload=function()
                    {
                            if(this.readyState==4 && this.status==200)
                            {
                            	//alert(this.responseText);
                            	let users=JSON.parse(this.responseText);
                            	let text="<tr class='bg-dark'>";
                            	text=text+"<th>EMAIL</th>";
                            	text=text+"<th>PASSWORD</th>";
                            	text=text+"<th>PHONE</th>";
                            	text=text+"<th>ADDRESS</th>";
                            	text=text+"<th>DESIG</th>";
                            	text=text+"</tr>";
                            	for(user of users)
								{
                            		text=text+"<tr>";
                            		text=text+"<td>"+user.email+"</td>";
                            		text=text+"<td>"+user.password+"</td>";
                            		text=text+"<td>"+user.phone+"</td>";
                            		text=text+"<td>"+user.address+"</td>";
                            		text=text+"<td>"+user.desig+"</td>";
                            		text=text+"</tr>";
                            	}
                            	document.getElementById("responseTable").innerHTML=text;
                            }
                        };
        	xhtr.send();
	}
    function fun1()
    {
        let email=document.getElementById("email").value;
        let password=document.getElementById("password").value;
        let phone=document.getElementById("phone").value;
        let address=document.getElementById("address").value;
        let data="email="+email+"&password="+password+"&phone="+phone+"&address="+address;
        let xhtr=new XMLHttpRequest();
        xhtr.open("POST","register.jsp");
        xhtr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhtr.onload=function()
                    {
                            if(this.readyState==4 && this.status==200)
                            {
                            	alert(this.responseText);
                            	fun2();
                            }
                        };
        xhtr.send(data);
    }    
    
</script>