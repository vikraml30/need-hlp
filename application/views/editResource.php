<?php

$id = '';
$first_name = '';
$last_name = '';
$address = '';
$service_type = '';
$email = '';
$city = '';
$state = '';
$mobile = '';
$image = '';

if(!empty($resourceData))
{
    foreach ($resourceData as $uf)
    {
        $id = $uf->id;
		$first_name = $uf->first_name;
		$last_name = $uf->last_name;
		$address = $uf->address;
		$service_type = $uf->service_type;
		$email = $uf->email;
		$city = $uf->city;
		$state = $uf->state;
		$mobile = $uf->mobile;
		$image = $uf->image_url;
    }
}


?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Resource Management
        <small>Add / Edit Resource</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
                
                
                
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Resource Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    
                    <form role="form" action="<?php echo base_url() ?>resources/editResource" method="post" id="editResource" role="form" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">First Name</label>
                                        <input type="text" class="form-control" id="fname" placeholder="First Name" name="first_name" value="<?php echo $first_name; ?>" maxlength="128">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="resourceId" />    
                                    </div>
                                </div>
								
								<div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="fname">Last Name</label>
                                        <input type="text" class="form-control" id="lname" placeholder="Last Name" name="last_name" value="<?php echo $last_name; ?>" maxlength="128">
                                    </div>
                                </div>
							</div>	
                           
                            <div class="row">
							
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">Image</label>
										<input class="form-control required" value="<?php echo $image; ?>" id="image" name="image" type="file" >
										<img height="50" width="50" src="<?php echo base_url().$image; ?>" alt="">
                                    </div>
                                </div>
							
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<?php echo $email; ?>" maxlength="128">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="mobile">Mobile Number</label>
                                        <input type="text" class="form-control" id="mobile" placeholder="Mobile Number" name="mobile" value="<?php echo $mobile; ?>" maxlength="10">
                                    </div>
                                </div>
                            </div>
							
							<div class="row">
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" id="address" placeholder="Enter address" name="address" value="<?php echo $address; ?>" maxlength="128">
                                    </div>
                                </div>
                            </div>
							
							<div class="row">
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="state">State</label>
                                        <input type="text" class="form-control" id="state" placeholder="State" name="state" value="<?php echo $state; ?>" maxlength="128">
                                    </div>
                                </div>
                            </div>
							
							<div class="row">
								<div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <input type="text" class="form-control" id="city" placeholder="City" name="city" value="<?php echo $city; ?>" maxlength="128">
                                    </div>
                                </div>
                            </div>
							
							
                        </div><!-- /.box-body -->
    
                        <div class="box-footer">
                            <input type="submit" onclick="return check_valid();" class="btn btn-primary" value="Submit" />
                            <input type="reset" class="btn btn-default" value="Reset" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>                    
                </div>
                <?php } ?>
                <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
                ?>
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('success'); ?>
                </div>
                <?php } ?>
                
                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>    
    </section>
</div>

<script type="text/javascript">
    function check_valid(){
        var fname 	 = $('#fname').val();
        var lname	 = $('#lname').val();
        var email	 = $('#email').val();
        var address	 = $('#address').val();
        var mobile	 = $('#mobile').val();
        var city	 = $('#city').val();
        var state	 = $('#state').val();
        
        if( '' == fname){
            alert("Please enter first name");
            return false;
        }
        
        if( '' == lname){
            alert("Please enter last name");
            return false;
        }
        
        if( '' == address){
            alert("Please enter address");
            return false;
        }
        
        if( '' == mobile){
            alert("Please enter mobile number");
            return false;
        }
        
        if( '' == city){
            alert("Please enter city");
            return false;
        }
        
        if( '' == state){
            alert("Please enter state");
            return false;
        }
        
        return true;
    }
</script>