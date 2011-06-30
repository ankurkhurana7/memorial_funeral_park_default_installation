<?php
//require './includes/bootstrap.inc';
//drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);
//$_SERVER['REMOTE_ADDR'] = '10.0.1.4';  // to prvent the warning Undefined index: REMOTE_ADDR in /home/kunal/drupal/includes/bootstrap.inc on line 1317
$lid  = 1;                    // SET LOCATION ID
$con = mysql_connect("localhost","root","kunalmysql");
if (!$con)
{
        die('Could not connect: ' . mysql_error());
}
mysql_select_db('',$con);
$mig = "DROP TABLE IF EXISTS `site2`.`obit_members`";
$mig1 = "CREATE TABLE `site2`.`obit_members` LIKE `CManager_development`.`obit_members`";
$mig2 = "INSERT INTO `site2`.`obit_members` SELECT * FROM `CManager_development`.`obit_members`";
mysql_query($mig) or die($mig. mysql_error());
mysql_query($mig1) or die($mig1. mysql_error());
mysql_query($mig2) or die($mig2. mysql_error());


mysql_select_db('site2',$con);
$sqlmt = "SELECT * from obit_members where location_id = '$lid'";
$rsmd = mysql_query($sqlmt) or die($sqlmt. mysql_error());
//print_r("start: ".strftime('%c')."");
$r=0;
while($rowmd = mysql_fetch_array($rsmd))
{
$mysqltime= "".(trim($rowmd['created_at']))."";
$timestamp = strtotime($mysqltime);


//$a = time() + (7 * 24 * 60 * 60);
$userinfo = array(
      'name' => "".(trim($rowmd['username']))."",
      'init' => '',
      'mail' => "".(trim($rowmd['email']))."",
      'pass' => 'obituarypassword',
      'status' => 1,
      'created' => $timestamp
    );

    $account = user_save('', $userinfo);

    // Terminate if an error occured during user_save().
    if (!$account) {
      $account = "Error saving user account!";
    }
    else
	{
	$r=$r+1;
	echo "user migrated : ".$r."\n";
	}
}

$mig4 = "DROP TABLE IF EXISTS `site2`.`obit_members`";
mysql_query($mig4);
?>
DONE!!
