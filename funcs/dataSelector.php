    <?php


    class dataSelector {    

			private $db;
			
			public function __construct($servername, $username, $password, $dbname) {
				$this->db = mysqli_connect($servername, $username, $password, $dbname);
				$this->db->set_charset("utf8");
			}
			
			function getCountryId($cnt_title) {
				$sql = "SELECT * FROM countries WHERE cnt_title = '".$cnt_title."' ";
				$result = $this->db->query($sql);
					if ($result->num_rows > 0) {
						while($row = $result->fetch_assoc()) {
							return $row["cnt_id"];
						}
					}else{
						return 0;
					}
			}

			function getUserId($usr_name) {	
				$sql = "SELECT * FROM users WHERE usr_name = '".$usr_name."' ";
				$result = $this->db->query($sql);
				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						return $row["usr_id"];
					}
				}else{
					return 0;
				}
			}

			function get_date($date_from,$date_to,$cnt_id = 0,$usr_id = 0) {
				$res = array();
				$sql = "SELECT * FROM send_log_aggregated WHERE date >= '".$date_from."' AND date <= '".$date_to."'";
				if(isset($cnt_id) && !$cnt_id == 0){
					$sql .= " AND cnt_id = '".$cnt_id."' ";
				}
				if(isset($usr_id) && !$usr_id == 0){
					$sql .= " AND usr_id = '".$usr_id."' ";
				}
				$sql .= " ORDER BY date asc";
				$result = $this->db->query($sql);
				if ($result->num_rows > 0) {
					while($row = $result->fetch_assoc()) {
						array_push($res, array('Date' => $row["date"],'success' => $row["success"], 'failed' => $row["failed"]));
					}
					return $res;
				}else{
					return 0;
				}
			}
		}

		
		?>