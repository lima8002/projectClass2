<?php
/* a separate class to perform simple queries and return the result */
namespace oldspice;

use oldspice\Database;
use \Exception;

class Query extends Database {
  private $query_string;
  private $query_type;
  private $allowed_query_types = array('select','update','insert','delete');
  private $query_params = array();
  private $response = array();
  private $errors = array();
  private $data = array();

  public function __construct( $query_string ) {
    // construct the parent class (Database)
    parent::__construct();
    // store the query string
    $this -> query_string = $query_string;
    $this -> query_type = $this -> detectQueryType();
  }

  public function execute( Array $params ) {
    // this function receives the parameters for the query
    // check if the query type is known
    try {
      if ( $this -> query_type == false ) {
        throw new Exception('query type not recognised');
      }
    }
    catch ( Exception $exc ) {
      $this -> errors['query'] = $exc -> getMessage();
      return $this -> respond( false);
    }

    try {
      if ( $this -> matchParams( $params ) == false ) {
        throw new Exception('query parameters do not match');
      }
    }
    catch ( Exception $exc ) {
      $this -> errors['parameter'] = $exc -> getMessage();
      return $this -> respond( false);
    }
    // $param_string = $this -> buildParamString( $params );
    try{
      $statement = $this -> connection -> prepare($this -> query_string);
      if ( !$statement ) {
        throw new Exception( $this -> connection -> error );
      }
      if ( count($params) > 0 ) {
        // build the parameter string, eg iii
        $param_string = $this -> buildParamString( $params );
        $statement -> bindparam( $param_string, ...$param );
      }
      if ( $statement -> execute() == false ) {
        throw new Exeption('query' . $this -> connection -> error );
      }

    }
    catch( Exception $exc ) {
      $this -> errors['number'] = $this -> connection -> errno;
      $this -> errors['execution'] = $exc -> getMessage();
      return $this -> respond( false);
    }

    $result = $statement -> get_result();
    while( $row = $result -> fetch_assoc() ) {
      array_push( $this -> data, $row );
    }

    return $this -> respond( true );
  }

  public function detectQueryType() {
    // determine the query type eg select insert update or delete
    // trim spaces from beginning and end of query and convert to lowercase
    $lc_query = trim( strtolower( $this -> query_string ) );
    // check if the query starts with one of the $allowed_query_types
    foreach( $this -> allowed_query_types as $query_type ) {
      if( strpos($lc_query, $query_type ) === 0 ) {
        $type = $query_type;
      }
    }
    if ( $type ) {
      return $type;
    }
    else {
      return false;
    }
  }

  private function matchParams( Array $params ) {
    // this function matches the number of parameters to the number of ? in the query
    $slot_count = substr_count( $this -> query_string, '?' );
    $param_count = count( $params );
    return ($slot_count == $param_count) ? true : false;
  }

  private function respond( Boolean $success ) {
    // this function returns an array in the format of
    // [ 'success': Boolean, 'errors':[Array], 'data':[Array] ]
    if ( $success == false ) {
      $this -> response['errors'] = $this -> errors;
      $this -> response['success'] = false;
    }
    else {
      $this -> response['data'] = $this -> data;
      $this -> response['success'] = true;
    }
    return $this -> response;
  }

  private function buildParamString( Array $params ) {
    $param_string = array();
    $count = count( $params );
    if ( $count == 0 ) {
      return false;
    }
    else {
      foreach( $params as $param ) {
        if ( is_int($param) ) {
          array_push( $param_string, 'i' );
        }
        elseif ( is_string($param) ) {
          array_push( $param_string, 's' );
        }
        elseif ( is_double($param) ) {
          array_push( $param_string, 'd' );
        }
        else {
          array_push( $param_string, 'b' );
        }
      }
    }
    return implode( '', $param_string );
  }
}
?>