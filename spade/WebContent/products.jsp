<html>
    <head>
        <title>Registration</title>
           <meta charset="utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

           <!-- Bootstrap CSS -->
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-                ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
           <!--<link  rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">-             -->
          <style type="text/css">
            .container.main{
                 margin-top: 4.0em;
              }
              
              #delete{
                  display:inline;
              }
			  
			  li a{
				  color:#f4f4f4;
			  }
			  
          </style>
    </head>
    <body>
      <nav class="navbar fixed-top navbar-expand-lg navbar-light " style="background-color: #1B1B1B;">
         <a class="navbar-brand" href="/" style="color:#f4f4f4;">Spade<i class=""></i></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-                                  controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="" style="color:#f4f4f4;"></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="" style="color:#f4f4f4;"></a>
                </li>
             </ul>
			
         </div>
     </nav>
    
   <br>
   <br>
   	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-      UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>	
		
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">	
       

<style>
	body{
	background:url();
    background-size: cover;
	background-repeat:no-repeat;
    background-position: center;

}
	#newTop{
		margin-top:50px;
	}
	h1{
		text-align:center;
		
	}

	.jumbotron {
            background:url(https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80);
            background-size: cover;
	        background-repeat:no-repeat;
            background-position: center;

             }
	.boxShadow {
		box-shadow: 5px 10px 8px #888888;
	}
	
	body {
            background-color:#ffffff;
	}
	
	.jumbotron{
		background-color:#687864;
	}
	
    .align{
    	margin:0 auto;
    }

    .card-columns {
      @include media-breakpoint-only(lg) {
       column-count: 4;
     }
     @include media-breakpoint-only(xl) {
      column-count: 5;
     }

     .boxShadow{
     	padding: 10px;
        box-shadow: 5px 10px 8px #888888;
     }

   
}
	
</style>

<div class="jumbotron">
   <h1 class="display-4" class="align" style="color:#fff">Welcome To Spade</h1>
  <!--<p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or         information.  </p>-->
   <hr class="my-4" class="align" style="color:#fff;">
  <p style="text-align:center ;color:#fff ">It uses utility classes for typography and spacing to space content out within the larger container.</p>
  <div class="box" style="margin-left: 350px;  width: 100%; ">
  	<form class="form-inline my-2 my-lg-0" action="" method="">
  	  <input class="form-control mr-sm-2" name="search" placeholder="Search" aria-label="Search" style="width:500px;">
      <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
     </form>
  </div>

     
</div>

<div class="container" id="newTop">


<form  action="productfilter.jsp" method="get">
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect">Filter</label>
      <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
       <option selected>No Filter</option>
        <option value="Sedan">sedan</option>
        <option value="SUV">SUV</option>
        <option value="Sports">Sports</option>
        <option value="parts">parts</option>
      </select>
    </div>
    <div class="col-auto my-1">
      <button type="submit" class="btn btn-primary" >Submit</button>
    </div>
  </div>
 </form>

  <div class="row row-cols-1 row-cols-md-3 row-cols-sm-1">
  <div class="col mb-4 ">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
 
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
   <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="row row-cols-1 row-cols-md-3">
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
 
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
   <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
  <div class="col mb-4">
    <div class="card boxShadow">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
      </div>
    </div>
  </div>
 </div> 
</div>

<style>
.center {
  text-align: center;
  margin: auto;
}

.bg-dark {
  background: #333;
  color: #f4f4f4;
}

footer {
  padding:2.2rem;
  width:100%;
}

footer p {
  margin: 0;
}
</style>

 <footer class="center bg-dark">
    <p>Spade &copy; 2020</p>
  </footer>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

</body>
</html>
