<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Admin System Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-page">
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
		  <h1>
			<i class="fa fa-users"></i> Register
		  </h1>
		</section>
		<div style="float: right;width: 55%;">Already member? Click here to <a href="<?php echo base_url() ?>login">Login</a></div>
		<section class="content">
			<div class="row">
				<!-- left column -->
				<div class="col-md-8">
				  <!-- general form elements -->
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Enter User Details</h3>
						</div><!-- /.box-header -->
						
						<!-- form start -->
						
							<?php
							$this->load->helper('form');
							$error = $this->session->flashdata('error');
							if($error)
							{
								?>
								<div class="alert alert-danger alert-dismissable">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
									<?php echo $error; ?>                    
								</div>
							<?php }
							$success = $this->session->flashdata('success');
							if($success)
							{
								?>
								<div class="alert alert-success alert-dismissable">
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
									<?php echo $success; ?>                    
								</div>
							<?php } ?>
						
						
						<form role="form" id="addUser" action="<?php echo base_url() ?>register/addNewUser" method="post" role="form">
							<div class="box-body">
								<div class="row">
									<div class="col-md-6">                                
										<div class="form-group">
											<label for="fname">Full Name</label>
											<input type="text" class="form-control required" id="fname" name="fname" maxlength="128">
										</div>
										
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="email">Email address</label>
											<input type="text" class="form-control required email" id="email"  name="email" maxlength="128">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="password">Password</label>
											<input type="password" class="form-control required" id="password"  name="password" maxlength="10">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="cpassword">Confirm Password</label>
											<input type="password" class="form-control required equalTo" id="cpassword" name="cpassword" maxlength="10">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="mobile">Mobile Number</label>
											<input type="text" class="form-control required digits" id="mobile" name="mobile" maxlength="10">
										</div>
									</div>
									<input type="hidden" name="role" id="role" value="2">    
								</div>
							</div><!-- /.box-body -->
		
							<div class="box-footer">
								<input type="submit" class="btn btn-primary" value="Submit" />
								<input type="reset" class="btn btn-default" value="Reset" />
							</div>
						</form>
					</div>
				</div>
			</div>    
		</section>
		
	</div>

    <script src="<?php echo base_url(); ?>assets/js/jQuery-2.1.4.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  </body>
</html>
<script src="<?php echo base_url(); ?>assets/js/addUser.js" type="text/javascript"></script>