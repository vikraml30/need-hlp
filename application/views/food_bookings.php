<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Food booking Management
      </h1>
    </section>
    
    <section class="content">
        <div class="row">
			<div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Food booking List</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Mobile</th>
                      <th>Category</th>
                      <th>Item</th>
                      <th>Quantity</th>
                      <th>Price</th>
                      <th>Total</th>
                      <th>Repeat Order</th>
                      <th>Respond</th>
                    </tr>
                    <tr style="background-color:grey;"><td colspan=9><b>UnRead</b></td></tr>
                    <?php
                    if(!empty($unreadFoodBookingRecords))
                    { 
                        foreach($unreadFoodBookingRecords as $record)
                        {
                    ?>
                    <tr>
                      <td><?php echo $record->user_mobile ?></td>
                      <td><?php echo $record->category ?></td>
                      <td><?php echo $record->item ?></td>
                      <td><?php echo $record->quantity ?></td>
                      <td><?php echo $record->price ?></td>
                      <td><?php echo $record->total_price ?></td>
                      <td><?php echo $record->repeate_order ?></td>
                      <td><a href="respondFoodBooking?fbid=<?php echo $record->fbid; ?>&mobile=<?php echo $record->mobile; ?>&device_id=<?php echo $record->device_registration_id; ?>"><button>Respond</button></a></td>
                    </tr>
                    <?php
                        }
                    } else {
                        echo '<tr><td colspan=9>No unread bookings</td></tr>';
                    }
                    
                    if(!empty($readFoodBookingRecords))
                    { ?>
                    <tr style="background-color:grey;"><td colspan=9><b>Read</b></td></tr>
                    <?php   foreach($readFoodBookingRecords as $record)
                        {
                    ?>
                    
                    <tr>
                      <td><?php echo $record->user_mobile ?></td>
                      <td><?php echo $record->category ?></td>
                      <td><?php echo $record->item ?></td>
                      <td><?php echo $record->quantity ?></td>
                      <td><?php echo $record->price ?></td>
                      <td><?php echo $record->total_price ?></td>
                      <td><?php echo $record->repeate_order ?></td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
                  
                </div><!-- /.box-body -->

              </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>