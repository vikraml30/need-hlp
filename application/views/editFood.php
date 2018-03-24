<?php

$id = '';
$category = '';
$item = '';
$price = '';

if(!empty($foodsData)) {
    foreach ($foodsData as $uf) {
        $id = $uf->id;
		$category = $uf->category;
		$item = $uf->item;
		$price = $uf->price;
    }
}


?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Food Management
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
                
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Enter Food Details</h3>
                    </div><!-- /.box-header -->
                    <!-- form start -->
                    
                    <form role="form" action="<?php echo base_url() ?>foods/editFood" method="post" id="editFood" role="form" enctype="multipart/form-data">
					<input type="hidden" value="<?php echo $id; ?>" name="id" id="foodId" />
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="category">Category</label>
                                        <select name="category">
											<option value="">Select food category</option>
											<option <?php if("breakfast"==$category){echo "selected='selected'";}?> value="breakfast">Breakfast</option>
											<option <?php if("lunch"==$category){echo "selected='selected'";}?> value="lunch">Lunch</option>
											<option <?php if("dinner"==$category){echo "selected='selected'";}?> value="dinner">Dinner</option>
										</select>
                                    </div>
                                </div>
								
								<div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="item_name">Item Name</label>
                                        <input type="text" class="form-control required" value="<?php echo $item; ?>" id="item" name="item" maxlength="128">
                                    </div>
                                    
                                </div>
								
								<div class="col-md-6">                                
                                    <div class="form-group">
                                        <label for="price">Price</label>
                                        <input type="text" class="form-control required" value="<?php echo $price; ?>" id="price" name="price" maxlength="128">
                                    </div>
								</div>
							</div>	
							
                        </div><!-- /.box-body -->
    
                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary" value="Submit" />
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