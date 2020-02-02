<?php

namespace oldspice;

use oldspice\Database;
use oldspice\Session;
use \Exception;

class WishList extends Database {

  public function __construct() {
    parent::__construct();
  }

  public function addItem( $product_id ) {
    // check if user is authenticated
    if ( Session::get('auth') == false ) {
      return false;
    }
    else {
      $account_id = Session::get('auth');
      // see if the user already has a wishlist
      $query = "SELECT wishlist_id FROM wishlist WHERE account_id= UNHEX( ? )";
      $statement = $this -> connection -> prepare( $query );
      $statement -> bind_param('s', $account_id );
      $statement -> execute();
      $result = $statement -> get_result();
      if( $result -> num_rows == 0 ) {
        // the user does not have a wishlist in database
        // create a new wishlist
        $wishlist_id = $this -> createWishList( $account_id );
      }
      else {
        // the user has a wishlist in database
        $row = $result -> fetch_assoc();
        $wishlist_id = $row['wishlist_id'];
      }
      // insert the item into the wishlist_item table
      $add_query = "
      INSERT INTO 
      wishlist_item 
      (wishlist_id,product_id,created)
      VALUES
      ( ?, ?, NOW() )
      ";
      $statement = $this -> connection -> prepare( $add_query );
      $statement -> bind_param( 'ii', $wishlist_id, $product_id );
      $statement -> execute();

      if( $this -> connection -> errno == '1062' ) {
        // item is already in list
        return false;
      }
      else {
        return true;
      }
    }
  }

  private function createWishList( $account_id ) {
    $query = "
    INSERT INTO 
    wishlist 
    ( account_id, created, active )
    VALUES 
    ( UNHEX(?) , NOW(), 1 )";

    $statement = $this -> connection -> prepare( $query );
    $statement -> bind_param('s', $account_id);
    $statement -> execute();
    // return the wishlist id
    return $this -> connection -> insert_id;

  }

  public function getWishListTotal() {
    if( Session::get('auth') == false ) {
      return false;
    }
    else{
      $query = "SELECT COUNT(product_id) AS total FROM wishlist_item WHERE wishlist_id= ? ";
      $account_id = Session::get('auth');
      // get the user's wishlist_id
      $wish_query = "SELECT wishlist_id FROM wishlist WHERE account_id = HEX(?) ";
      $statement = $this -> connection -> prepare( $wish_query );
      $statement -> bind_param('s', $account_id );
      $statement -> execute();
      $result = $statement -> get_result();
      $row = $result -> fetch_assoc();
      $wishlist_id = $row['wishlist_id'];

      // run query to get total
      $statement = $this -> connection -> prepare( $query );
      $statement -> bind_param('i', $wishlist_id );
      $statement -> execute();
      $result = $statement -> get_result();
      $total_row = $result -> fetch_assoc();
      return $total_row['total'];
    }
  }

  public function getWishListItems() {

  }
}
?>