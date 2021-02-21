<?php
require_once "config/database.php";
require_once "config/fungsi_tanggal.php";
require_once "config/fungsi_rupiah.php";


if (empty($_SESSION['username']) && empty($_SESSION['password'])){
	echo "<meta http-equiv='refresh' content='0; url=index.php?alert=1'>";
}
else {
	if ($_GET['module'] == 'start') {
		include "modules/start/view.php";
	}

	elseif ($_GET['module'] == 'medicinas') {
		include "modules/medicinas/view.php";
	}

	elseif ($_GET['module'] == 'form_medicinas') {
		include "modules/medicinas/form.php";
	}
	

	elseif ($_GET['module'] == 'transaccion') {
		include "modules/transaccion/view.php";
	}

	elseif ($_GET['module'] == 'form_transaccion') {
		include "modules/transaccion/form.php";
	}


	elseif ($_GET['module'] == 'inventario') {
		include "modules/inventario/view.php";
	}

	elseif ($_GET['module'] == 'stock_report') {
		include "modules/stock_report/view.php";
	}

	elseif ($_GET['module'] == 'user') {
		include "modules/user/view.php";
	}


	elseif ($_GET['module'] == 'form_user') {
		include "modules/user/form.php";
	}

	elseif ($_GET['module'] == 'profile') {
		include "modules/profile/view.php";
		}


	elseif ($_GET['module'] == 'form_profile') {
		include "modules/profile/form.php";
	}

	elseif ($_GET['module'] == 'password') {
		include "modules/password/view.php";
	}
}
?>