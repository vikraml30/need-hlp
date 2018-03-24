<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Car booking Management
      </h1>
    </section>
    
   <!-- <div id="dialog-form" title="Create new user">
      <p class="validateTips">All form fields are required.</p>
     
      <form>
        <fieldset>
          <label for="name">Name</label>
          <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
       
          <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
        </fieldset>
      </form>
    </div>-->
    
    <section class="content">
        <div class="row">
			<div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Car booking List</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Mobile</th>
                      <th>Destination</th>
                      <th>From address</th>
                      <th>From date</th>
                      <th>To date</th>
                      <th>Number of person</th>
                      <th>Time</th>
                      <th>Car Type</th>
                      <th>Created Date</th>
                      <th>Respond</th>
                    </tr>
                    <tr style="background-color:grey;"><td colspan=9><b>UnRead</b></td></tr>
                    <?php
                    if(!empty($unreadCarBookingRecords))
                    { 
                        foreach($unreadCarBookingRecords as $record)
                        {
                    ?>
                    <tr>
                      <td><?php echo $record->user_mobile ?></td>
                      <td><?php echo $record->destination ?></td>
                      <td><?php echo $record->from_address ?></td>
                      <td><?php echo $record->from_date ?></td>
                      <td><?php echo $record->to_date ?></td>
                      <td><?php echo $record->noofperson ?>
                      <td><?php echo $record->time ?>
                      </td><td><?php echo $record->car_type ?></td>
                      <td><?php echo date('d-m-Y', strtotime($record->carB_created_date)); ?></td>
                      <td><a href="car_bookings/respondCarBooking?mobile=<?php echo $record->user_mobile; ?>&device_id=<?php echo $record->device_registration_id; ?>"><button>Respond</button></a></td>
                    </tr>
                    <?php
                        }
                    } else {
                        echo '<tr><td colspan=9>No unread bookings</td></tr>';
                    }
                    
                    if(!empty($readCarBookingRecords))
                    { ?>
                    <tr style="background-color:grey;"><td colspan=9><b>Read</b></td></tr>
                    <?php   foreach($readCarBookingRecords as $record)
                        {
                    ?>
                    
                    <tr>
                      <td><?php echo $record->user_mobile ?></td>
                      <td><?php echo $record->destination ?></td>
                      <td><?php echo $record->from_address ?></td>
                      <td><?php echo $record->from_date ?></td>
                      <td><?php echo $record->to_date ?></td>
                      <td><?php echo $record->noofperson ?>
                      <td><?php echo $record->time ?>
                      </td><td><?php echo $record->car_type ?></td>
                      <td><?php echo date('d-m-Y', strtotime($record->created_date)); ?></td>
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