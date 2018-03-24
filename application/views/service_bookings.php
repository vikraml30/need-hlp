<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Service booking Management
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Service booking List</h3>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Mobile</th>
                      <th>Requirement</th>
                      <th>Date of Visit</th>
                      <th>Time of Visit</th>
                      <th>Service Address</th>
                      <th>Respond</th>
                    </tr>
                    <tr style="background-color:grey;"><td colspan=9><b>UnRead</b></td></tr>
                    <?php
                    if(!empty($unreadServiceBookingRecords))
                    { 
                        foreach($unreadServiceBookingRecords as $record)
                        {
                    ?>
                    <tr>
                        <td><?php echo $record->user_mobile; ?></td>
                        <td><?php echo $record->requirement; ?></td>
                        <td><?php echo $record->service_date; ?></td>
                        <td><?php echo $record->service_time; ?></td>
                        <td><?php echo $record->service_address; ?></td>
                        <td>
                            <a href="service_bookings/respondServiceBooking?sbid=<?php echo $record->sbid; ?>&mobile=<?php echo $record->user_mobile; ?>&device_id=<?php echo $record->device_registration_id; ?>">
                                <button>Respond</button>
                            </a>
                        </td>
                    </tr>
                    <?php
                        }
                    } else {
                        echo '<tr><td colspan=9>No unread bookings</td></tr>';
                    }
                    
                    if(!empty($readServiceBookingRecords))
                    { ?>
                    <tr style="background-color:grey;"><td colspan=9><b>Read</b></td></tr>
                    <?php   foreach($readServiceBookingRecords as $record)
                        {
                    ?>
                    
                    <tr>
                      <td><?php echo $record->user_mobile ?></td>
                      <td><?php echo $record->requirement ?></td>
                      <td><?php echo $record->service_date ?></td>
                      <td><?php echo $record->service_time ?></td>
                      <td><?php echo $record->service_address ?></td>
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