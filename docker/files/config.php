<?php
/**
* Project Config
*
* @package MajorDoMo
* @author Serge Dzheigalo <jey@tut.by> http://smartliving.ru/
* @version 1.1
*/

Define('DB_HOST', getenv('DB_HOST'));
Define('DB_NAME', getenv('DB_NAME'));
Define('DB_USER', getenv('DB_USER'));
Define('DB_PASSWORD', getenv('DB_PASSWORD'));

Define('DIR_TEMPLATES', "./templates/");
Define('DIR_MODULES', "./modules/");
Define('DEBUG_MODE', 1);
Define('UPDATES_REPOSITORY_NAME', 'smarthome');

Define('GMAIL_USER', getenv('MAIL_USER'));
Define('GMAIL_PASSWORD', getenv('EMAIL_PASSWORD'));
Define('PROJECT_TITLE', 'MajordomoSL');
Define('PROJECT_BUGTRACK', "bugtrack@smartliving.ru");

date_default_timezone_set('UTC');

if (isset($_ENV["COMPUTERNAME"]) && $_ENV["COMPUTERNAME"])
{
   Define('COMPUTER_NAME', strtolower($_ENV["COMPUTERNAME"]));
}
else
{
   // Your computer name (optional)
   Define('COMPUTER_NAME', 'mycomp');
}

Define('DOC_ROOT', dirname(__FILE__)); // Your htdocs location (should be detected automatically)
Define('SERVER_ROOT', '/var/www');

if (getenv('VIRTUAL_HOST')) {
    Define('BASE_URL', getenv('VIRTUAL_HOST'));
} else {
    // Your base URL:port (!!!)
    Define('BASE_URL', 'http://127.0.0.1:80');
}


Define('ROOT', DOC_ROOT . "/");
Define('ROOTHTML', "/");
Define('PROJECT_DOMAIN', $_SERVER['SERVER_NAME']);

// 1-wire OWFS server
//Define('ONEWIRE_SERVER', 'tcp://localhost:8234');


Define('HOME_NETWORK', '192.168.0.*,172.*.0.*,192.168.99.*'); // home and docker network (optional)
Define('EXT_ACCESS_USERNAME', $_SERVER['EXT_ACCESS_USERNAME']); // access details for external network (internet)
Define('EXT_ACCESS_PASSWORD', $_SERVER['EXT_ACCESS_PASSWORD']);

/// (Optional)
//Define('DROPBOX_SHOPPING_LIST', 'c:/data/dropbox/list.txt');  // (Optional)

$restart_threads = array(
    'cycle_execs.php',
    'cycle_main.php',
    'cycle_ping.php',
    'cycle_scheduler.php',
    'cycle_states.php',
    'cycle_webvars.php'
    //'cycle_mercurypower.php'
);
