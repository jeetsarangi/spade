

<html>
    <head>
        <title>Pay</title>
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
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-                          q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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

  label{
    color:#17a2b8;
  }
  
  .row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
  padding: 10px 15px;
}
hr{
  color:#f4f4f4;
}

</style>

<div class="container" id="newTop">
  
    <div class="row">
    <div class="container">
          <h1 style="margin:0 auto;"><span style="color:#117a8b; margin-bottom:30px">Payment</span></h1>
          <hr style="width:30%">
    </div>
    
        <div style="width: 350px; margin: 30px auto;">
          <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fab fa-cc-visa" style="color:navy;"></i>
              <i class="fab fa-cc-amex" style="color:blue;"></i>
              <i class="fab fa-cc-mastercard" style="color:red;"></i>
              <i class="fab fa-cc-discover" style="color:orange;"></i>
            </div>
            <form action="order" method="get">
                <div class="form-group">
                  <label for="cardholder">Cardholder's Name </label>
                  <input class="form-control" type="text" name="cardholder" placeholder="Cardholder's Name" autofocus required>
                </div>
                 <div class="form-group">
                   <label for="cardholder">Card Number </label>
                    <input class="form-control"  type="text" name="cardnumber" placeholder="Card Number" required>
                </div>
                   
                    <div class="form-group">
                        <div class="row">
                            <div class="col-50" >
                              <label for="expyear">Exp Year</label>
                              <input class="form-control" type="text" id="expyear" name="expyear" placeholder="MM / YY" autofocus required>
                            </div>
                            <div class="col-50" >
                              <label for="cvv">CVV/CCV</label>
                              <input class="form-control" type="text" id="cvv" name="cvv" placeholder="cvv/ccv" autofocus required>
                            </div>
                        </div>
                     </div>
                      
                 <div class="form-group">
                  <label for="remark">Remarks </label>
                    <textarea class="form-control" name="remark" placeholder="Remarks"rows="4" cols="50"></textarea>
                </div>

                <div ALIGN="CENTER">
                 <div class="form-group">
                    <button class="btn btn-lg btn-info btn-lg" type="submit">Proceed</button>
                 </div>
               
                
                </div>
            </form>
          
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
  padding: 2.2rem;
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
