<?php
class PostgreDB 
{
	protected $host; 
	protected $username; 
	protected $password; 
	protected $port; 
	protected $dbname; 
	protected $error = null; 
	protected $dbconnect; 
	protected $sql; 
	protected $query; 
	protected $result; 
	protected $oid = null; 
	protected $oid_res; 
	protected $persistent; 

	public function postgreDB($DB="", $Host="localhost", $PgPort=5432, $User="root", $pass="pgsql", $persist=0) { 
		$this->host = $Host; 
		$this->dbname = $DB; 
		$this->username = $User; 
		$this->password = $pass; 
		$this->port = $PgPort; 
		$this->persistent = $persist; 
		$this->connect(); 
	} 

	private function connect() { 
		$connect = "host=".$this->host." port=".$this->port." dbname=".$this->dbname." user=".$this->username; 
		if (!empty($this->password)) 
			$connect.= " password=".$this->password; 
		if ($this->persistent) 
			$this->dbconnect = pg_pconnect($connect); 
		else 
			$this->dbconnect = pg_connect($connect); 
		if (!$this->dbconnect) 
			$this->error = "No se puede conectar a la BD ".$this->dbname; 
	}

	public function query($sql) { 
		$this->sql = $sql;
		$this->result = $this->execute(); 
		$this->error = $this->error();
		if($this->result && !$this->error) {
			$row = $this->numRows();
			if($row > 0) {
				$arr = array();
				for ($row = 0; $result = $this->fetchResult($row); $row++) {
					$arr[$row] = $result;
				}
				return $arr;				
			}
			return true; 
		} else {
			return false;
		}
	}

	private function numRows() {
			if ($this->result && !$this->error) {
				return pg_num_rows($this->result); 
			}

			return false;
	}

	public function fetchResult(&$row, $assoc=PGSQL_ASSOC) {
		if (!$this->error) 
		{
			$arr = pg_fetch_array($this->result, NULL, $assoc); 
			return $arr; 
		} 
		else 
		{ 
			echo "Ocurrio un error, $this->error"; 
			return null; 
		} 
	}

	public function closeConnection() {
		if (!$this->persistent) {
			pg_close($this->dbconnect); 
		}
	}

	public function begin() {
		pg_query($this->dbconnect, "begin");
		$this->oid = pg_lo_create($this->dbconnect);
		$this->result = $this->open();
		$this->oid_res = $this->result;
	}

	public function rollBack() { 
		if(!$this->oid) {
			echo "$this->error<br>\n"; 
		} else {
			pg_query ($this->dbconnect, "Rollback");
		} 
	}

	public function commit() {
		if(!$this->oid) {
			echo "$this->error<br>\n"; 
		} else {
			pg_query ($this->dbconnect, "Commit");
		} 
	}

	public function execute() {
		$this->result = pg_query($this->dbconnect, $this->sql);
		$this->error = pg_result_error($this->result);
		return $this->result;
	}

	public function error() {
		return $this->error;
	}

	public function open($mode="rw") { 
		$this->result = pg_lo_open($this->dbconnect, $this->oid, $mode); 
		return $this->result; 
	}

	public function convert($data = array(), $table) {
		$vals = pg_convert($this->dbconnect, $table, $data);
		return $vals; 
	}

	public function lastInsertId() {
		$vals = pg_last_oid($this->result);
		return $vals; 
	}

}