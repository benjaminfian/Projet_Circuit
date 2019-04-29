<?php
	session_start();
	require_once "Facebook/autoload.php";
	$FB =new \Facebook\Facebook([
		'app_id' => '2354539051471677',
		'app_secret' => '2018edb24e8fe1e06e0512a5d3459808',
		'default_graph_version' => 'v2.10'
		]);
	
	$helper = $FB->getRedirectLoginHelper();	

?>